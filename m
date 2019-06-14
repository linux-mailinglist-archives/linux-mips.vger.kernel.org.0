Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A44A45490
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2019 08:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfFNGQW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jun 2019 02:16:22 -0400
Received: from mga11.intel.com ([192.55.52.93]:31869 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfFNGQW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 Jun 2019 02:16:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jun 2019 23:16:22 -0700
X-ExtLoop1: 1
Received: from pgsmsx114.gar.corp.intel.com ([10.108.55.203])
  by orsmga007.jf.intel.com with ESMTP; 13 Jun 2019 23:16:20 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.167]) by
 pgsmsx114.gar.corp.intel.com ([169.254.4.185]) with mapi id 14.03.0415.000;
 Fri, 14 Jun 2019 14:11:00 +0800
From:   "Tan, Ley Foon" <ley.foon.tan@intel.com>
To:     "hch@lst.de" <hch@lst.de>
CC:     "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "monstr@monstr.eu" <monstr@monstr.eu>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "lftan.linux@gmail.com" <lftan.linux@gmail.com>
Subject: Re: switch nios2 and microblaze to use the generic uncached
 segement support
Thread-Topic: switch nios2 and microblaze to use the generic uncached
 segement support
Thread-Index: AQHVGdkT7boJI3RS4kqc/A8kJoZA3KaatPRz//+BHIA=
Date:   Fri, 14 Jun 2019 06:11:00 +0000
Message-ID: <1560492659.21652.3.camel@intel.com>
References: <20190603065324.9724-1-hch@lst.de>
         <1560476434.21652.1.camel@intel.com> <20190614054418.GA6722@lst.de>
In-Reply-To: <20190614054418.GA6722@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.226.248.78]
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBFDFFA76CA1BE40A273987AB2E67CFB@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gRnJpLCAyMDE5LTA2LTE0IGF0IDA3OjQ0ICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToNCj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDk6NDA6MzRBTSArMDgwMCwgTGV5IEZvb24g
VGFuIHdyb3RlOg0KPiA+IA0KPiA+IEhpwqBDaHJpc3RvcGgNCj4gPiANCj4gPiBDYW4gdGhpcyBw
YXRjaCBpbsKgaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9kbWEtbWFwcGluZy5n
aQ0KPiA+IHQvc2gNCj4gPiBvcnRsb2cvcmVmcy9oZWFkcy9mb3ItbmV4dA0KPiA+IA0KPiA+IFtQ
QVRDSCAxLzJdIG5pb3MyOiB1c2UgdGhlIGdlbmVyaWMgdW5jYWNoZWQgc2VnbWVudCBzdXBwb3J0
IGluIGRtYS0NCj4gPiBkaXJlY3QNCj4gSGkgTGV5IEZvb24sDQo+IA0KPiBJIGRvbid0IHVuZGVy
c3RhbmQgdGhlIGFib3ZlIHNlbnRlbmNlLsKgwqBEb2VzIGl0IGltcGx5IGEgUmV2aWV3ZWQtYnk/
DQpTb3JyeSwgdHlwbyBpbiBteSBwcmV2aW91cyBlbWFpbC7CoA0KQ2FuJ3QgZmluZCB0aGlzIHBh
dGNoIGluIHRoZSBnaXQgbGluayB5b3UgcHJvdmlkZWQgKGZvci1uZXh0IGJyYW5jaCkuDQpEaWQg
eW91IHB1c2ggdGhlIHBhdGNoPw0KDQpSZWdhcmRzDQpMZXkgRm9vbg==
