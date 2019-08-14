Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4800F8D5D7
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2019 16:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfHNOVH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Aug 2019 10:21:07 -0400
Received: from forward104p.mail.yandex.net ([77.88.28.107]:60473 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726047AbfHNOVG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Aug 2019 10:21:06 -0400
Received: from mxback17o.mail.yandex.net (mxback17o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::68])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id B8DDB4B00C5D;
        Wed, 14 Aug 2019 17:21:02 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback17o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id lHITOvJ5Zg-L1OW0uIj;
        Wed, 14 Aug 2019 17:21:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565792462;
        bh=2goG6sOEmEpNNLyGZ/CfVW3KfhwHp/mcaHfgHDLSIXY=;
        h=Cc:To:From:Subject:Date:Message-Id;
        b=ntWvKFO+2o3ZI+Vj55Mnq2X3C2OCxhMqDDDTXSeqhngEUUFmAad8eVe50BgtauwiJ
         QlWLBfYAO+bRVH3D+Ho0V7xgiqyvq8RJv01dozfKFXMp+FkcZUMkvW/q3iOpw9SBg/
         T386qWg/c0yoZSPfbIMfH3EQarlfaloAFi9I/9dY=
Authentication-Results: mxback17o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id bO59i2TLG9-KtYqTGuD;
        Wed, 14 Aug 2019 17:20:59 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Message-Id: <20190814172100.KtYqTGuD@smtp2o.mail.yandex.net>
Date:   Wed, 14 Aug 2019 22:20:48 +0800
Subject: Re: [PATCH 3/7] MIPS: fw: Record prom memory
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     aurelien@aurel32.net, paul.burton@mips.com, sfr@canb.auug.org.au,
        chenhc@lemote.com, Serge Semin <fancer.lancer@gmail.com>,
        yasha.che3@gmail.com, matt.redfearn@mips.com,
        linux-mips@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CjIwMTnlubQ45pyIMTTml6Ug5LiL5Y2IODo1MOS6jiBUaG9tYXMgQm9nZW5kb2VyZmVyIDx0c2Jv
Z2VuZEBhbHBoYS5mcmFua2VuLmRlPuWGmemBk++8mgo+Cj4gT24gV2VkLCBBdWcgMTQsIDIwMTkg
YXQgMDM6MDM6NDFQTSArMDMwMCwgU2VyZ2UgU2VtaW4gd3JvdGU6IAo+ID4gT24gVGh1LCBBdWcg
MDgsIDIwMTkgYXQgMDM6NTA6MDlQTSArMDgwMCwgSmlheHVuIFlhbmcgd3JvdGU6IAo+ID4gPiBi
b290X21lbV9tYXAgaXMgbm9sb25nZXIgZXhpc3Qgc28gd2UgbmVlZCB0byBtYWludGFpbiBhIGxp
c3QgCj4gPiA+IG9mIHByb20gbWVtb3J5IGJ5IG91cnNlbHZlcy4gCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+IAo+ID4gPiAt
LS0gCj4gPiA+wqAgYXJjaC9taXBzL2Z3L2FyYy9tZW1vcnkuYyB8IDIwICsrKysrKysrKysrKysr
LS0tLS0tIAo+ID4gPsKgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKSAKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvZncvYXJjL21lbW9y
eS5jIGIvYXJjaC9taXBzL2Z3L2FyYy9tZW1vcnkuYyAKPiA+ID4gaW5kZXggNDI5YjdmOGQyYWVi
Li4wMmU5NTRiMzcwMGUgMTAwNjQ0IAo+ID4gPiAtLS0gYS9hcmNoL21pcHMvZncvYXJjL21lbW9y
eS5jIAo+ID4gPiArKysgYi9hcmNoL21pcHMvZncvYXJjL21lbW9yeS5jIAo+ID4gPiBAQCAtMjcs
NiArMjcsMTEgQEAgCj4gPiA+wqAgCj4gPiA+wqAgI3VuZGVmIERFQlVHIAo+ID4gPsKgIAo+ID4g
PiArI2RlZmluZSBNQVhfUFJPTV9NRU0gNSAKPiA+ID4gK3N0YXRpYyBwaHlzX2FkZHJfdCBwcm9t
X21lbV9iYXNlW01BWF9QUk9NX01FTV0gX19pbml0ZGF0YTsgCj4gPiA+ICtzdGF0aWMgcGh5c19h
ZGRyX3QgcHJvbV9tZW1fc2l6ZVtNQVhfUFJPTV9NRU1dIF9faW5pdGRhdGE7IAo+ID4gPiArc3Rh
dGljIHVuc2lnbmVkIGludCBucl9wcm9tX21lbSBfX2luaXRkYXRhOyAKPiA+ID4gKyAKPiA+ID7C
oCAvKiAKPiA+ID7CoMKgICogRm9yIEFSQyBmaXJtd2FyZSBtZW1vcnkgZnVuY3Rpb25zIHRoZSB1
bml0IG9mIG1lYXNzdXJpbmcgbWVtb3J5IGlzIGFsd2F5cyAKPiA+ID7CoMKgICogYSA0ayBwYWdl
IG9mIG1lbW9yeSAKPiA+ID4gQEAgLTEyOSw2ICsxMzQsNyBAQCB2b2lkIF9faW5pdCBwcm9tX21l
bWluaXQodm9pZCkgCj4gPiA+wqAgfSAKPiA+ID7CoCAjZW5kaWYgCj4gPiA+wqAgCj4gPiA+ICsg
bnJfcHJvbV9tZW0gPSAwOyAKPiA+ID7CoCBwID0gUFJPTV9OVUxMX01ERVNDOyAKPiA+ID7CoCB3
aGlsZSAoKHAgPSBBcmNHZXRNZW1vcnlEZXNjcmlwdG9yKHApKSkgeyAKPiA+ID7CoCB1bnNpZ25l
ZCBsb25nIGJhc2UsIHNpemU7IAo+ID4gPiBAQCAtMTM5LDYgKzE0NSwxMiBAQCB2b2lkIF9faW5p
dCBwcm9tX21lbWluaXQodm9pZCkgCj4gPiA+wqAgdHlwZSA9IHByb21fbWVtdHlwZV9jbGFzc2lm
eShwLT50eXBlKTsgCj4gPiA+wqAgCj4gPiA+wqAgYWRkX21lbW9yeV9yZWdpb24oYmFzZSwgc2l6
ZSwgdHlwZSk7IAo+ID4gPiArIAo+ID4gPiArIGlmICh0eXBlID09IEJPT1RfTUVNX1JPTV9EQVRB
KSB7IAo+ID4gPiArIHByb21fbWVtX2Jhc2VbbnJfcHJvbV9tZW1dID0gYmFzZTsgCj4gPiA+ICsg
cHJvbV9tZW1fc2l6ZVtucl9wcm9tX21lbV0gPSBzaXplOyAKPiA+ID4gKyBucl9wcm9tX21lbSsr
OyAKPiA+IAo+ID4gQXJlIHlvdSBzdXJlLCB0aGF0IGZpdmUgcHJvbS1tZW0gcmVnaW9ucyBpcyBl
bm91Z2g/IAo+Cj4gaXQncyBub3QgZW5vdWdoOiAKSGkgVGhvbWFzCgpJIGNhbiBzZWUgb25seSB0
d28gUk9NIERBVEEgbWFwcyBpbiB5b3VyIHN5c3RlbS4KQXMgd2UncmUgb25seSByZWNvcmRpbmcg
Uk9NIERBVEEgaGVyZSwgcmVzdCB0eXBlcyBvZiBtZW1vcnkgd2lsbCBiZSBoYW5kbGVkIGJ5IG1l
bWJsb2NrLgoKPgo+IEFSQ0g6IE1pY3Jvc29mdC1KYXp6IAo+IFBST01MSUI6IEFSQyBmaXJtd2Fy
ZSBWZXJzaW9uIDEgUmV2aXNpb24gMSAKPiBDUFUgcmV2aXNpb24gaXM6IDAwMDAwNDMwIAo+IEZQ
VSByZXZpc2lvbiBpczogMDAwMDA1MDAgCj4gRGV0ZXJtaW5lZCBwaHlzaWNhbCBSQU0gbWFwOiAK
PiBtZW1vcnk6IDAwMDU0MDAwIEAgMDAwMDAwMDAgKHJlc2VydmVkKSAKPiBtZW1vcnk6IDAwMDJj
MDAwIEAgMDAwNTQwMDAgKHVzYWJsZSkgCj4gbWVtb3J5OiAwMDAxZjAwMCBAIDAwN2UwMDAwIChS
T00gZGF0YSkgCj4gbWVtb3J5OiAwMDdiMjAwMCBAIDAwN2ZmMDAwICh1c2FibGUpIAo+IG1lbW9y
eTogMDAwNGYwMDAgQCAwMGZiMTAwMCAoUk9NIGRhdGEpIAo+IG1lbW9yeTogMDEwMDAwMDAgQCAw
MTAwMDAwMCAodXNhYmxlKSAKPiBtZW1vcnk6IDAwMzIzMDAwIEAgMDAwODAwMDAgKHJlc2VydmVk
KSAKPiBtZW1vcnk6IDAwNDNkMDAwIEAgMDAzYTMwMDAgKHVzYWJsZSkgCj4KPiB0aGF0J3MgZnJv
bSBhIE9saXZldHRpIE03MDAgc3lzdGVtLiAKPgo+IFRob21hcy4gCj4KPiAtLSAKPiBDcmFwIGNh
biB3b3JrLiBHaXZlbiBlbm91Z2ggdGhydXN0IHBpZ3Mgd2lsbCBmbHksIGJ1dCBpdCdzIG5vdCBu
ZWNlc3NhcmlseSBhIAo+IGdvb2QgaWRlYS7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFsgUkZDMTkyNSwgMi4zIF0gCi0tCkppYXh1biBZYW5nCg==

