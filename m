Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 997F02D0D1F
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 10:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgLGJgC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 04:36:02 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:43645 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726552AbgLGJgC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Dec 2020 04:36:02 -0500
X-UUID: 348010998e2e43548394d21504c14202-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=PzXAt74ogdSVvHGMlNFXOX2qEwkVCLrOs16Lzlq64es=;
        b=k+X/1rFfwFpZMAEkah4MgD2ZeqokyvLAqLUlDsnktgKdMIFqmyWKKApTNu1IkqPaLWkLsNc4f0fKD8WblYkfaMXzMOTj/ZcnDNYcI11UhYC3jSPH91n/jrYR8nekYgyYlcfm182nv7PpIhXgPUisc2iSYsZLJRu82iIyxXGXF4o=;
X-UUID: 348010998e2e43548394d21504c14202-20201207
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1053587091; Mon, 07 Dec 2020 17:35:09 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Dec
 2020 17:35:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Dec 2020 17:35:05 +0800
Message-ID: <1607333707.18575.4.camel@mhfsdcap03>
Subject: Re: [PATCH v5 10/19] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date:   Mon, 7 Dec 2020 17:35:07 +0800
In-Reply-To: <20201205152427.29537-11-Sergey.Semin@baikalelectronics.ru>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
         <20201205152427.29537-11-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AEB5FF3D303205152315F12801E2B2247DEE288D20E6EED68AE982586109AE1D2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gU2F0LCAyMDIwLTEyLTA1IGF0IDE4OjI0ICswMzAwLCBTZXJnZSBTZW1pbiB3cm90ZToNCj4g
RFdDIFVTQjMgRFQgbm9kZSBpcyBzdXBwb3NlZCB0byBiZSBjb21wbGlhbnQgd2l0aCB0aGUgR2Vu
ZXJpYyB4SENJDQo+IENvbnRyb2xsZXIgc2NoZW1hLCBidXQgd2l0aCBhZGRpdGlvbmFsIHZlbmRv
ci1zcGVjaWZpYyBwcm9wZXJ0aWVzLCB0aGUNCj4gY29udHJvbGxlci1zcGVjaWZpYyByZWZlcmVu
Y2UgY2xvY2tzIGFuZCBQSFlzLiBTbyBsZXQncyBjb252ZXJ0IHRoZQ0KPiBjdXJyZW50bHkgYXZh
aWxhYmxlIGxlZ2FjeSB0ZXh0LWJhc2VkIERXQyBVU0IzIGJpbmRpbmdzIHRvIHRoZSBEVCBzY2hl
bWENCj4gYW5kIG1ha2Ugc3VyZSB0aGUgRFdDIFVTQjMgbm9kZXMgYXJlIGFsc28gdmFsaWRhdGVk
IGFnYWluc3QgdGhlDQo+IHVzYi14aGNpLnlhbWwgc2NoZW1hLg0KPiANCj4gTm90ZSAxLiB3ZSBo
YXZlIHRvIGRpc2NhcmQgdGhlIG5vZGVuYW1lIHJlc3RyaWN0aW9uIG9mIGJlaW5nIHByZWZpeGVk
IHdpdGgNCj4gImR3YzNAIiBzdHJpbmcsIHNpbmNlIGluIGFjY29yZGFuY2Ugd2l0aCB0aGUgdXNi
LWhjZC55YW1sIHNjaGVtYSBVU0Igbm9kZXMNCj4gYXJlIHN1cHBvc2VkIHRvIGJlIG5hbWVkIGFz
ICJedXNiKEAuKikiLg0KPiANCj4gTm90ZSAyLiBUaGUgY2xvY2stcmVsYXRlZCBwcm9wZXJ0aWVz
IGFyZSBtYXJrZWQgYXMgb3B0aW9uYWwgdG8gbWF0Y2ggdGhlDQo+IERXQyBVU0IzIGRyaXZlciBl
eHBlY3RhdGlvbiBhbmQgdG8gaW1wcm92ZSB0aGUgYmluZGluZ3MgbWFpbmFpbmFiaWxpdHkNCj4g
c28gaW4gY2FzZSBpZiB0aGVyZSBpcyBhIGdsdWUtbm9kZSBpdCB3b3VsZCB0aGUgcmVzcG9uc2li
bGUgZm9yIHRoZQ0KPiBjbG9ja3MgaW5pdGlhbGl6YXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBTZXJnZSBTZW1pbiA8U2VyZ2V5LlNlbWluQGJhaWthbGVsZWN0cm9uaWNzLnJ1Pg0KPiANCj4g
LS0tDQo+IA0KPiBDaGFuZ2Vsb2cgdjI6DQo+IC0gRGlzY2FyZCAnfCcgZnJvbSB0aGUgZGVzY3Jp
cHRpb25zLCBzaW5jZSB3ZSBkb24ndCBuZWVkIHRvIHByZXNlcnZlDQo+ICAgdGhlIHRleHQgZm9y
bWF0dGluZyBpbiBhbnkgb2YgdGhlbS4NCj4gLSBEcm9wIHF1b3RlcyBmcm9tIGFyb3VuZCB0aGUg
c3RyaW5nIGNvbnN0YW50cy4NCj4gLSBGaXggdGhlICJjbG9jay1uYW1lcyIgcHJvcCBkZXNjcmlw
dGlvbiB0byBiZSByZWZlcnJpbmcgdGhlIGVudW1lcmF0ZWQNCj4gICBjbG9jay1uYW1lcyBpbnN0
ZWFkIG9mIHRoZSBvbmVzIGZyb20gdGhlIERhdGFib29rLg0KPiANCj4gQ2hhbmdlbG9nIHYzOg0K
PiAtIEFwcGx5IHVzYi14aGNpLnlhbWwjIHNjaGVtYSBvbmx5IGlmIHRoZSBjb250cm9sbGVyIGlz
IHN1cHBvc2VkIHRvIHdvcmsNCj4gICBhcyBlaXRoZXIgaG9zdCBvciBvdGcuDQo+IA0KPiBDaGFu
Z2Vsb2cgdjQ6DQo+IC0gQXBwbHkgdXNiLWRyZC55YW1sIHNjaGVtYSBmaXJzdC4gSWYgdGhlIGNv
bnRyb2xsZXIgaXMgY29uZmlndXJlZA0KPiAgIHRvIHdvcmsgaW4gYSBnYWRnZXQgbW9kZSBvbmx5
LCB0aGVuIGFwcGx5IHRoZSB1c2IueWFtbCBzY2hlbWEgdG9vLA0KPiAgIG90aGVyd2lzZSBhcHBs
eSB0aGUgdXNiLXhoY2kueWFtbCBzY2hlbWEuDQo+IC0gRGlzY2FyZCB0aGUgUm9iJ2VzIFJldmll
d2VkLWJ5IHRhZy4gUGxlYXNlIHJldmlldyB0aGUgcGF0Y2ggb25lIG1vcmUNCj4gICB0aW1lLg0K
PiANCj4gQ2hhbmdlbG9nIHY1Og0KPiAtIEFkZCAic25wcyxkaXMtc3BsaXQtcXVpcmsiIHByb3Bl
cnR5IHRvIHRoZSBEV0MgVVNCMyBEVCBzY2hlbWEuDQo+IC0gQWRkIGEgY29tbWl0IGxvZyB0ZXh0
IGFib3V0IHRoZSBjbG9jay1yZWxhdGVkIHByb3BlcnR5IGNoYW5nZXMuDQo+IC0gTWFrZSBzdXJl
IGRyX21vZGUgZXhpc3QgdG8gYXBwbHkgdGhlIFVTQi1nYWRnZXQtb25seSBzY2hlbWEuDQo+IC0t
LQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0ICAgICAgICAgIHwgMTI4
IC0tLS0tLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMueWFtbCAg
ICB8IDMxMiArKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEyIGluc2Vy
dGlvbnMoKyksIDEyOCBkZWxldGlvbnMoLSkNCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMueWFt
bA0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvZHdjMy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMu
dHh0DQo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAxYWFlMmI2MTYwYzEuLjAw
MDAwMDAwMDAwMA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2R3YzMudHh0DQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEsMTI4ICswLDAgQEANCj4gLXN5bm9w
c3lzIERXQzMgQ09SRQ0KPiAtDQpbLi4uXQ0KPiArDQo+ICsgIGNsb2NrLW5hbWVzOg0KPiArICAg
IGNvbnRhaW5zOg0KPiArICAgICAgYW55T2Y6DQo+ICsgICAgICAgIC0gZW51bTogW2J1c19lYXJs
eSwgcmVmLCBzdXNwZW5kXQ0KPiArICAgICAgICAtIHRydWUNCj4gKw0KPiArICB1c2ItcGh5Og0K
PiArICAgbWluSXRlbXM6IDENCmluZGVudGF0aW9uOiBleHBlY3RlZCA0DQo+ICsgICBpdGVtczoN
Cj4gKyAgICAgLSBkZXNjcmlwdGlvbjogVVNCMi9IUyBQSFkNCj4gKyAgICAgLSBkZXNjcmlwdGlv
bjogVVNCMy9TUyBQSFkNCj4gKw0KPiArICBwaHlzOg0KPiArICAgIG1pbkl0ZW1zOiAxDQo+ICsg
ICAgaXRlbXM6DQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBVU0IyL0hTIFBIWQ0KPiArICAgICAg
LSBkZXNjcmlwdGlvbjogVVNCMy9TUyBQSFkNCj4gKw0KPiArICBwaHktbmFtZXM6DQo+ICsgICAg
bWluSXRlbXM6IDENCj4gKyAgICBpdGVtczoNCj4gKyAgICAgIC0gY29uc3Q6IHVzYjItcGh5DQo+
ICsgICAgICAtIGNvbnN0OiB1c2IzLXBoeQ0KWy4uLl0NCg0K

