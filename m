Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9AF51A1B7E
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 07:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgDHFO1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 01:14:27 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42901 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgDHFO1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 01:14:27 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3471580237;
        Wed,  8 Apr 2020 17:14:23 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1586322863;
        bh=YkXvA/8SLVreNAYgan070U1NrymtwAPnJ2gFe0lYFwU=;
        h=From:To:CC:Subject:Date;
        b=iLIfvVjXyMiurQkbhtrj+nP2eHl0vJDaMQFOGG5FJk5jISCcl8QHwH6cZcSgWGXzm
         MrdU9HWY6EjCJ5Mt3twae5mNIAM4OaTFgdSJPmiQ+djtXK/df6zV3wplCtDDaUqWtm
         FkTJTAQPJ1pWpL1DoNlmIZ2WQO/02cbhTVZ29P+dk1vA8vt7rksqHZ5UCgCRg5wjsl
         8j0ny5y56prjsBgu7EHITYfVClUGwyPoAITJ1sZeVh4dzffVwlExMeko6myII+zYiQ
         nSVxNA7eDRdGrPcXaFOLDFP4Vq6zhlyOaTzQp9tg0q6CDRVJzx6v+VWUoZ4ACKBu1t
         nKLCktG3ruteA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e8d5db00000>; Wed, 08 Apr 2020 17:14:24 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 17:14:23 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 8 Apr 2020 17:14:22 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Hamish Martin" <Hamish.Martin@alliedtelesis.co.nz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Dealing with holes in CPU address space
Thread-Topic: Dealing with holes in CPU address space
Thread-Index: AQHWDWSQGXFxFOrcR0ujeloVxC+pHA==
Date:   Wed, 8 Apr 2020 05:14:22 +0000
Message-ID: <fcb8f2655452f60a7c734e2ce54ac4d47eec7e92.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <87A62D6F9DDB66408682E8C27463080B@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgQWxsLA0KDQpJJ20gdHJ5aW5nIHRvIHBvcnQgYW4gb2xkIEJyb2FkY29tIE1JUFMgQ1BVIChC
Q001MzAwMykgdG8gYSBzaGlueSBuZXcNCmtlcm5lbC4gSSBoYXZlIHNvbWUgb2xkIGhpc3Rvcmlj
IHNvdXJjZSBmcm9tIGEgbG9uZyBmb3Jnb3R0ZW4gQnJvYWRjb20NCkxESyBidXQgSSdkIHByZWZl
ciB0byBkbyB0aGluZ3MgdGhlIG1vZGVybiB3YXkgd2l0aCBkZXZpY2UtdHJlZXMuDQoNClRoZSBw
cm9ibGVtIEkndmUgYmVlbiBncmFwcGxpbmcgd2l0aCBpcyB0cnlpbmcgdG8gb3BlbiB1cCBhY2Nl
c3MgdG8gYWxsDQpvZiB0aGUgUkFNIG9uIHRoZSBib2FyZC4gSXQgaGFzIDUxMk1CIG9mIEREUjIu
IFRoZSBDUFUgaGFzIHR3byBhcmVhcw0Kd2hlcmUgdGhpcyBhcHBlYXJzLiBUaGUgZmlyc3QgMTI4
TUIgaXMgZnJvbSAwIHRvIDB4MDdmZmZmZmYgdGhlIHNlY29uZA0KYXJlYSBpcyBmcm9tIDB4ODgw
MDAwMDAgdG8gMHg5ZmZmZmZmZi4NCg0KU29DIHBlcmlwaGVyYWxzIGFyZSBhdCAweDE4MDAwMDAw
IGFuZCB0aGVyZSBpcyBhbiBJTyB3aW5kb3cgZm9yIGZsYXNoDQphdCAweDIwMDAwMDAwLg0KDQpU
aGUgb2xkIGNvZGUgaGFzIHNvbWUgY3VzdG9tIHRsYiBpbml0aWFsaXNhdGlvbiB0byBkZWFsIHdp
dGggdGhpcyBidXQgSQ0KZmlndXJlZCBpdCBzaG91bGQgYmUgcG9zc2libGUgd2l0aCB0aGUgZm9s
bG93aW5nIGR0cyBzbmlwcGV0Lg0KDQogICAgICAgIG1lbW9yeUAwIHsNCiAgICAgICAgICAgICAg
ICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAw
MDAwIDB4MDgwMDAwMDANCiAgICAgICAgICAgICAgICAgICAgICAgMHg4ODAwMDAwMCAweDE4MDAw
MDAwPjsNCiAgICAgICAgfTsNCg0KSSBlbmQgdXAgd2l0aCBvbmx5IDEyOE1CIGF2YWlsYWJsZS4g
VGhpcyBhcHBlYXJzIHRvIGJlDQpiZWNhdXNlIHRoZSBkZWZhdWx0IEhJR0hNRU1fU1RBUlQgb2Yg
MHgyMDAwMDAwMCBzdG9wcyB0aGUgcmVzdCBmcm9tDQpiZWluZyBtYWRlIGF2YWlsYWJsZS4gSWYg
SSBhZGQgYW4gb3ZlcnJpZGUgb2YgSElHSE1FTV9TVEFSVCB0bw0KMHhmZmZmZmZmZiBJIHNlZW0g
dG8gaGF2ZSB0aGUgZnVsbCA1MTJNQiBhdmFpYWJsZSBidXQgdGhlbiBJIGdldCBhDQprZXJuZWwg
cGFuaWMNCg0KICBDUFUgMCBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBh
dCB2aXJ0dWFsIGFkZHJlc3MgMWZjMDAwMDAsIGVwYyA9PSA4MDAxNjdiOCwgcmEgPT0gODAwZTI4
NjANCg0KMHgxZmMwMDAwMCBpcyBpbiB0aGUgcmFuZ2Ugd2hlcmUgdGhlIFNvQyBwZXJpcGhlcmFs
cyBhcmUgc28gSSdtDQp0aGlua2luZyB0aGF0IGlzIHRoZSBwcm9ibGVtLiBCdXQgdGhlbiBhZ2Fp
biB0aGF0IGlzIGEgdmlydHVhbCBhZGRyZXNzDQpzbyBtYXliZSBpdCdzIGp1c3QgYSBjby1pbmNp
ZGVuY2UuDQoNCkFueXdheSBJJ2QgcmVhbGx5IGFwcHJlY2lhdGUgYW55IGd1aWRhbmNlIHRoYXQg
YW55b25lIGNvdWxkIHByb3ZpZGUgb24NCnRoaXMuIEV2ZW4gaWYgaXQncyBqdXN0ICJnbyBsb29r
IGF0IHRoaXMgU29DIi4NCg0KVGhhbmtzLA0KQ2hyaXMNCg0KDQo=
