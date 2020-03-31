Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D80A199DBC
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 20:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbgCaSIc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 14:08:32 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:1679 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726199AbgCaSIc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Mar 2020 14:08:32 -0400
X-UUID: 174587bf37f543c0bcedc8c9f412e457-20200401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B2WGXD+okc3OAMherNCj95maawSKPkr+yhClbmy/cpc=;
        b=gO/eZcWlGlRN12xXvBy/Jx3LzDA4HGqr7peHlErgIFjkcMhPpGsJPjCoVhHnvj4P3uqMCsunbu58eLcVqadc4/813e30sCzGlcVl79yPGXmxDs/8L5SVXfoTcP0squHjpiOSrKB/zVuMnIXK4kUzZ1Pp0r7ac4NyS8sGvvkZvnI=;
X-UUID: 174587bf37f543c0bcedc8c9f412e457-20200401
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <weijie.gao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 421072275; Wed, 01 Apr 2020 02:08:19 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 1 Apr
 2020 02:08:15 +0800
Received: from mcddlt001.mediatek.inc (10.19.240.15) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 1 Apr 2020 02:08:13 +0800
From:   Weijie Gao <weijie.gao@mediatek.com>
To:     <linux-mtd@lists.infradead.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Piotr Sroka <piotrs@cadence.com>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Weijie Gao <weijie.gao@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: add documentation for mt7621-nand driver
Date:   Wed, 1 Apr 2020 02:07:59 +0800
Message-ID: <1585678079-5999-2-git-send-email-weijie.gao@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585678079-5999-1-git-send-email-weijie.gao@mediatek.com>
References: <1585678079-5999-1-git-send-email-weijie.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3384A60C0D5DDDAA02D07F0CCC8D72BA3C78905B95A6884107B1114CBA68EF0C2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gZm9yIE1lZGlhVGVrIE1UNzYyMSBOQU5EIGZs
YXNoIGNvbnRyb2xsZXINCmRyaXZlci4NCg0KU2lnbmVkLW9mZi1ieTogV2VpamllIEdhbyA8d2Vp
amllLmdhb0BtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vYmluZGluZ3MvbXRkL21lZGlhdGVrLG10
NzYyMS1uZmMueWFtbCAgICAgfCA2OCArKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5n
ZWQsIDY4IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tZWRpYXRlayxtdDc2MjEtbmZjLnlhbWwNCg0KZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWVkaWF0ZWssbXQ3
NjIxLW5mYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tZWRp
YXRlayxtdDc2MjEtbmZjLnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAw
MDAwMDAuLjFjYTBjNWU5NWU0Yw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tZWRpYXRlayxtdDc2MjEtbmZjLnlhbWwNCkBAIC0wLDAg
KzEsNjggQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorJVlBTUwgMS4y
DQorLS0tDQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbWVkaWF0ZWss
bXQ3NjIxLW5mYy55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBNZWRpYVRlayBNVDc2MjEgU29DIE5BTkQgRmxh
c2ggQ29udHJvbGxlciAoTkZDKSBEVCBiaW5kaW5nDQorDQorbWFpbnRhaW5lcnM6DQorICAtIFdl
aWppZSBHYW8gPHdlaWppZS5nYW9AbWVkaWF0ZWsuY29tPg0KKw0KK2Rlc2NyaXB0aW9uOiB8DQor
ICBUaGlzIGRyaXZlciB1c2VzIGEgc2luZ2xlIG5vZGUgdG8gZGVzY3JpYmUgYm90aCBOQU5EIEZs
YXNoIGNvbnRyb2xsZXINCisgIGludGVyZmFjZSAoTkZJKSBhbmQgRUNDIGVuZ2luZSBmb3IgTVQ3
NjIxIFNvQy4NCisgIE1UNzYyMSBzdXBwb3J0cyBvbmx5IG9uZSBjaGlwIHNlbGVjdC4NCisNCitw
cm9wZXJ0aWVzOg0KKyAgIiNhZGRyZXNzLWNlbGxzIjogZmFsc2UNCisgICIjc2l6ZS1jZWxscyI6
IGZhbHNlDQorDQorICBjb21wYXRpYmxlOg0KKyAgICBlbnVtOg0KKyAgICAgIC0gbWVkaWF0ZWss
bXQ3NjIxLW5mYw0KKw0KKyAgcmVnOg0KKyAgICBpdGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9u
OiBSZWdpc3RlciBiYXNlIG9mIE5GSSBjb3JlDQorICAgICAgLSBkZXNjcmlwdGlvbjogUmVnaXN0
ZXIgYmFzZSBvZiBFQ0MgZW5naW5lDQorDQorICByZWctbmFtZXM6DQorICAgIGl0ZW1zOg0KKyAg
ICAgIC0gY29uc3Q6IG5maQ0KKyAgICAgIC0gY29uc3Q6IGVjYw0KKw0KKyAgY2xvY2tzOg0KKyAg
ICBpdGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiBTb3VyY2UgY2xvY2sgZm9yIE5GSSBjb3Jl
LCBmaXhlZCAxMjVNSHoNCisNCisgIGNsb2NrLW5hbWVzOg0KKyAgICBpdGVtczoNCisgICAgICAt
IGNvbnN0OiBuZmlfY2xrDQorDQorcmVxdWlyZWQ6DQorICAtIGNvbXBhdGlibGUNCisgIC0gcmVn
DQorICAtIHJlZy1uYW1lcw0KKyAgLSBjbG9ja3MNCisgIC0gY2xvY2stbmFtZXMNCisNCitleGFt
cGxlczoNCisgIC0gfA0KKyAgICBuZmljbG9jazogbmZpY2xvY2sgew0KKyAgICAJI2Nsb2NrLWNl
bGxzID0gPDA+Ow0KKyAgICAJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQorDQorICAgIAlj
bG9jay1mcmVxdWVuY3kgPSA8MTI1MDAwMDAwPjsNCisgICAgfTsNCisNCisgICAgbmFuZEAxZTAw
MzAwMCB7DQorICAgIAljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NzYyMS1uZmMiOw0KKw0KKyAg
ICAJcmVnID0gPDB4MWUwMDMwMDAgMHg4MDANCisgICAgCSAgICAgICAweDFlMDAzODAwIDB4ODAw
PjsNCisgICAgCXJlZy1uYW1lcyA9ICJuZmkiLCAiZWNjIjsNCisNCisgICAgCWNsb2NrcyA9IDwm
bmZpY2xvY2s+Ow0KKyAgICAJY2xvY2stbmFtZXMgPSAibmZpX2NsayI7DQorICAgIH07DQotLSAN
CjIuMTcuMQ0K

