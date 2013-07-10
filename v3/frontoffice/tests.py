"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""

from django.test import TestCase
from  frontoffice.models import Operation
from django.test.client import Client


class FrontofficeViewsTestCase(TestCase):
    fixtures = ['frontoffice_views_testdata.json']

    def setUp(self):
        self.client = Client()
        self.client.login(username='nmtsylla', password='massilia')

    def test_index(self):
        resp = self.client.get('/')
        self.assertEqual(resp.status_code, 200)

    def test_login(self):
        resp = self.client.post('/auth', {'username': 'nmtsylla', 'password': 'massilia'})
        self.assertEqual(resp.status_code, 301)

    def test_homepage(self):
        resp = self.client.get('/homepage')
        self.assertEqual(resp.status_code, 200)
        self.assertTrue('operation' in resp.context)