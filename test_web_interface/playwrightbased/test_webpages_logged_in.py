import pytest

from playwright.sync_api import Page, expect

URL = "http://localhost:5000"


# This test comes first so that we can "log in"
@pytest.fixture
def logged_in_page(page: Page):
    # Visit the backdoor route to establish the session cookie
    page.goto(f"{URL}/login-test-user")
    # Verify we are logged in
    return page


def test_get_edit_relation_RELATIONID(page: Page):
    page.goto(f"{URL}/edit_relation/0001247576")
    expect(page.get_by_role("heading", name="Edit relation")).to_be_visible()


#EOF