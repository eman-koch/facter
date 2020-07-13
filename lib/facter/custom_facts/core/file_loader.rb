# frozen_string_literal: true

require 'facter/custom_facts/core/logging'
require 'facter/custom_facts/core/legacy_facter'
require 'facter/custom_facts/util/fact'
require 'facter/custom_facts/util/collection'
require 'facter/custom_facts/util/fact'
require 'facter/custom_facts/util/loader'
require 'facter/custom_facts/core/execution/base'
require 'facter/custom_facts/core/execution/windows'
require 'facter/custom_facts/core/execution/posix'
require 'facter/custom_facts/util/values'
require 'facter/custom_facts/util/confine'

require 'facter/custom_facts/util/config'

require 'facter/custom_facts/util/normalization'
require 'facter/custom_facts/core/execution'
require 'facter/custom_facts/core/resolvable'
require 'facter/custom_facts/core/suitable'
require 'facter/custom_facts/util/resolution'
require 'facter/custom_facts/core/directed_graph'
require 'facter/custom_facts/core/resolvable'
require 'facter/custom_facts/core/aggregate'
require 'facter/custom_facts/util/composite_loader'
require 'facter/custom_facts/util/parser'
require 'facter/custom_facts/util/directory_loader'
require 'facter/custom_facts/util/nothing_loader'
require 'facter/custom_facts/util/nothing_loader'