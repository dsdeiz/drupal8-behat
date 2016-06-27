<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Testwork\Tester\Result\TestResult;
use Behat\Mink\Driver\Selenium2Driver;
use Behat\Behat\Hook\Scope\AfterStepScope;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * The parameters for the current context.
   */
  protected $parameters;

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct($parameters) {
    $this->parameters = $parameters;
  }

  /**
   * Take screenshot when a step fails.
   *
   * @AfterStep
   */
  public function takeScreenshot(AfterStepScope $scope) {
    if (TestResult::FAILED === $scope->getTestResult()->getResultCode()) {
      $url = $this->getSession()->getCurrentUrl();
      $driver = $this->getSession()->getDriver();
      if ($driver instanceof Selenium2Driver) {
        $feature_name = $scope->getFeature()->getTitle();
        $step_name = $scope->getStep()->getText();

        $filename = date('Y.m.d-H.i.s') . ' ' . $feature_name . '--' . $step_name;
        $filename = preg_replace('/[^a-zA-Z0-9-_\.]/', '-', $filename);
        $filename = strtolower($filename);

        $directory = $this->parameters['screenshots'];

        if (!is_dir($directory)) {
          $oldmask = umask(0);
          mkdir($directory, 0777);
          umask($oldmask);
        }

        file_put_contents("$directory/{$filename}.png", $this->getSession()->getScreenshot());
        echo sprintf('Tests failed on: "%s", screenshot saved in: "%s".', $url, $directory);
      }
    }
  }

}
