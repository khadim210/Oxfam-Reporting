__author__ = 'nmtsylla'

from import_export import resources
from frontoffice.models import Operation


class OperationResource(resources.ModelResource):

    class Meta:
        model = Operation