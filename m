Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951FA442E70
	for <lists+linux-mips@lfdr.de>; Tue,  2 Nov 2021 13:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhKBMvN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 08:51:13 -0400
Received: from m1554.mail.126.com ([220.181.15.54]:16005 "EHLO
        m1554.mail.126.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhKBMvM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Nov 2021 08:51:12 -0400
X-Greylist: delayed 1815 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Nov 2021 08:51:06 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=pMj+y
        BaKZirGjoOyUnfDVs9NHpYkoEkGcqYmMujT7j4=; b=mTD3ky4//7iACed20JTVN
        l0AY56UEQVbwQ1J5xyD5jrNNOV6fvAEkV8CUgw18Vo2M8hAOKcFj4730qsm1jw9+
        Fh52gZwOJD9T0X0+XMDxsGKXDA8ta8mdN5ynufOhL3yTQupM+ARPv+KZOeHhcdOL
        PFg0Y5DPxi06BmQNNwQgbY=
Received: from zhangzl2013$126.com ( [223.72.63.29] ) by
 ajax-webmail-wmsvr54 (Coremail) ; Tue, 2 Nov 2021 20:17:52 +0800 (CST)
X-Originating-IP: [223.72.63.29]
Date:   Tue, 2 Nov 2021 20:17:52 +0800 (CST)
From:   "Zhaolong Zhang" <zhangzl2013@126.com>
To:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     "Alexander Lobakin" <alobakin@pm.me>,
        "Yanteng Si" <siyanteng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: fix HUGETLB function without THP enabled
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
In-Reply-To: <20211102102051.GA7512@alpha.franken.de>
References: <20211102082437.3319235-1-zhangzl2013@126.com>
 <20211102102051.GA7512@alpha.franken.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <181761.42aa.17ce0959595.Coremail.zhangzl2013@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: NsqowAAXZUlxLIFhFFpOAQ--.20702W
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbitBE-z1pEE26trQAAs2
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CkF0IDIwMjEtMTEtMDIgMTg6MjA6NTEsICJUaG9tYXMgQm9nZW5kb2VyZmVyIiA8dHNib2dlbmRA
YWxwaGEuZnJhbmtlbi5kZT4gd3JvdGU6Cj5PbiBUdWUsIE5vdiAwMiwgMjAyMSBhdCAwNDoyNDoz
N1BNICswODAwLCBaaGFvbG9uZyBaaGFuZyB3cm90ZToKPj4gbHRwIHRlc3QgZnV0ZXhfd2FrZTA0
IHdpdGhvdXQgVEhQIGVuYWJsZWQgbGVhZHMgdG8gYmVsb3cgYnQ6Cj4+ICAgWzxmZmZmZmZmZjgw
YTAzNzI4Pl0gQlVHKzB4MC8weDgKPj4gICBbPGZmZmZmZmZmODBhMDYyNGM+XSBpbnRlcm5hbF9n
ZXRfdXNlcl9wYWdlc19mYXN0KzB4ODFjLzB4ODIwCj4+ICAgWzxmZmZmZmZmZjgwOTNhYzE4Pl0g
Z2V0X2Z1dGV4X2tleSsweGEwLzB4NDgwCj4+ICAgWzxmZmZmZmZmZjgwOTNiMDc0Pl0gZnV0ZXhf
d2FpdF9zZXR1cCsweDdjLzB4MWE4Cj4+ICAgWzxmZmZmZmZmZjgwOTNiMmMwPl0gZnV0ZXhfd2Fp
dCsweDEyMC8weDIyOAo+PiAgIFs8ZmZmZmZmZmY4MDkzZGJlOD5dIGRvX2Z1dGV4KzB4MTQwLzB4
YmQ4Cj4+ICAgWzxmZmZmZmZmZjgwOTNlNzhjPl0gc3lzX2Z1dGV4KzB4MTBjLzB4MWMwCj4+ICAg
WzxmZmZmZmZmZjgwODcwM2QwPl0gc3lzY2FsbF9jb21tb24rMHgzNC8weDU4Cj4+IAo+PiBNb3Zl
IHBtZF93cml0ZSgpIGFuZCBwbWRfcGFnZSgpIGZyb20gVFJBTlNQQVJFTlRfSFVHRVBBR0Ugc2Nv
cGUgdG8KPj4gTUlQU19IVUdFX1RMQl9TVVBQT1JUIHNjb3BlLCBiZWNhdXNlIGJvdGggVEhQIGFu
ZCBIVUdFVExCIHdpbGwgbmVlZAo+PiB0aGVtLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogWmhhb2xv
bmcgWmhhbmcgPHpoYW5nemwyMDEzQDEyNi5jb20+Cj4+IC0tLQo+PiAgYXJjaC9taXBzL2luY2x1
ZGUvYXNtL3BndGFibGUuaCB8IDQwICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+Cj5h
cHBsaWVkIHRvIG1pcHMtbmV4dC4KPgo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+IGlu
ZGV4IDgwNDg4OWI3MDk2NS4uMWZjZjRiZTVjZDIwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL21pcHMv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPj4gQEAgLTg2LDEwICs4NiwxMiBAQCBleHRlcm4gdm9pZCBwYWdpbmdfaW5pdCh2b2lk
KTsKPj4gICAqLwo+PiAgI2RlZmluZSBwbWRfcGh5cyhwbWQpCQl2aXJ0X3RvX3BoeXMoKHZvaWQg
KilwbWRfdmFsKHBtZCkpCj4+ICAKPj4gKyNpZm5kZWYgQ09ORklHX01JUFNfSFVHRV9UTEJfU1VQ
UE9SVAo+PiAgI2RlZmluZSBfX3BtZF9wYWdlKHBtZCkJCShwZm5fdG9fcGFnZShwbWRfcGh5cyhw
bWQpID4+IFBBR0VfU0hJRlQpKQo+PiAgI2lmbmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBB
R0UKPj4gICNkZWZpbmUgcG1kX3BhZ2UocG1kKQkJX19wbWRfcGFnZShwbWQpCj4+ICAjZW5kaWYg
LyogQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFICAqLwo+PiArI2VuZGlmIC8qIENPTkZJR19N
SVBTX0hVR0VfVExCX1NVUFBPUlQgKi8KPgo+V2hpbGUgYXBwbHlpbmcgSSd2ZSBzaW1wbGlmaWVk
IHRoYXQgaHVuayB0bwo+Cj4tI2RlZmluZSBfX3BtZF9wYWdlKHBtZCkgICAgICAgICAgICAgICAg
KHBmbl90b19wYWdlKHBtZF9waHlzKHBtZCkgPj4gUEFHRV9TSElGVCkpCj4tI2lmbmRlZiBDT05G
SUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKPi0jZGVmaW5lIHBtZF9wYWdlKHBtZCkgICAgICAgICAg
X19wbWRfcGFnZShwbWQpCj4tI2VuZGlmIC8qIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSAg
Ki8KPisjaWZuZGVmIENPTkZJR19NSVBTX0hVR0VfVExCX1NVUFBPUlQKPisjZGVmaW5lIHBtZF9w
YWdlKHBtZCkgICAgICAgICAgKHBmbl90b19wYWdlKHBtZF9waHlzKHBtZCkgPj4gUEFHRV9TSElG
VCkpCj4rI2VuZGlmIC8qIENPTkZJR19NSVBTX0hVR0VfVExCX1NVUFBPUlQgKi8KPgoKSXQgaXMg
bXVjaCBiZXR0ZXIuClRoYW5rcyBmb3IgeW91ciBraW5kIHJlcGx5LgoKUmVnYXJkcywKWmhhb2xv
bmcKCj5UaG9tYXMuCj4KPi0tIAo+Q3JhcCBjYW4gd29yay4gR2l2ZW4gZW5vdWdoIHRocnVzdCBw
aWdzIHdpbGwgZmx5LCBidXQgaXQncyBub3QgbmVjZXNzYXJpbHkgYQo+Z29vZCBpZGVhLiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgUkZDMTkyNSwgMi4z
IF0K
