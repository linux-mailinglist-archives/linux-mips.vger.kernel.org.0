Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA392B15BB
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 07:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgKMGEk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 01:04:40 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:7286 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725971AbgKMGEk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 01:04:40 -0500
X-UUID: 89d45e2cf6ad43ddb87e062b94636365-20201113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Ir233lDJkicbZtH4igG3ioOgvXcy46PlSo6Vzwnmbug=;
        b=Uf8jZkK0iOE13tH+FOTbW/47iUDPIpFZGRrA/L9Pt0HlBZ3vBhIu9B51H63OuSMAKNS3F/PQ9p6ZvDPZDYNplg57NSOFIT7cjrF9Lxm8Dt3YSKdegKlWslgwIW/8XqsRxjIedrB85CvcJ+naUaYWJQC6HTWAeNt4MrZ+WA/1+lE=;
X-UUID: 89d45e2cf6ad43ddb87e062b94636365-20201113
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 43766245; Fri, 13 Nov 2020 14:04:23 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Nov
 2020 14:04:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Nov 2020 14:04:19 +0800
Message-ID: <1605247459.31607.23.camel@mhfsdcap03>
Subject: Re: [PATCH v4 01/18] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date:   Fri, 13 Nov 2020 14:04:19 +0800
In-Reply-To: <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
         <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 35256F855D28B8E9938E1E871FD37442AB0633F28C0BB20F747BFD0A0256B7812000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gV2VkLCAyMDIwLTExLTExIGF0IDEyOjA4ICswMzAwLCBTZXJnZSBTZW1pbiB3cm90ZToNCj4g
VGhlcmUgY2FuIGJlIHRocmVlIGRpc3RpbmN0aXZlIHR5cGVzIG9mIHRoZSBVU0IgY29udHJvbGxl
cnM6IFVTQiBob3N0cywNCj4gVVNCIHBlcmlwaGVyYWxzL2dhZGdldHMgYW5kIFVTQiBPVEcsIHdo
aWNoIGNhbiBzd2l0Y2ggZnJvbSBvbmUgcm9sZSB0bw0KPiBhbm90aGVyLiBJbiBvcmRlciB0byBo
YXZlIHRoYXQgaGllcmFyY2h5IGhhbmRsZWQgaW4gdGhlIERUIGJpbmRpbmcgZmlsZXMsDQo+IHdl
IG5lZWQgdG8gY29sbGVjdCBjb21tb24gcHJvcGVydGllcyBpbiBhIGNvbW1vbiBEVCBzY2hlbWEg
YW5kIHNwZWNpZmljDQo+IHByb3BlcnRpZXMgaW4gZGVkaWNhdGVkIHNjaGVtYXMuIFNlZWluZyB0
aGUgdXNiLWhjZC55YW1sIERUIHNjaGVtYSBpcw0KPiBkZWRpY2F0ZWQgZm9yIHRoZSBVU0IgaG9z
dCBjb250cm9sbGVycyBvbmx5LCBsZXQncyBtb3ZlIHNvbWUgY29tbW9uDQo+IHByb3BlcnRpZXMg
ZnJvbSB0aGVyZSBpbnRvIHRoZSB1c2IueWFtbCBzY2hlbWEuIFNvIHRoZSBsYXRlciB3b3VsZCBi
ZQ0KPiBhdmFpbGFibGUgdG8gZXZhbHVhdGUgYWxsIGN1cnJlbnRseSBzdXBwb3J0ZWQgdHlwZXMg
b2YgdGhlIFVTQg0KPiBjb250cm9sbGVycy4NCj4gDQo+IFdoaWxlIGF0IGl0IGFkZCBhbiBleHBs
aWNpdCAiYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUiIGludG8gdGhlDQo+IHVzYi1oY2QueWFt
bCBhcyBzZXR0aW5nIHRoZSBhZGRpdGlvbmFsUHJvcGVydGllcy91bmV2YWx1YXRlUHJvcGVydGll
cw0KPiBwcm9wZXJ0aWVzIGlzIGdvaW5nIHRvIGJlIGdldCBtYW5kYXRvcnkgc29vbi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFNlcmdlIFNlbWluIDxTZXJnZXkuU2VtaW5AYmFpa2FsZWxlY3Ryb25p
Y3MucnU+DQo+IA0KPiAtLS0NCj4gDQo+IENoYW5nZWxvZyB2NDoNCj4gLSBUaGlzIGlzIGEgbmV3
IHBhdGNoIGNyZWF0ZWQgYXMgYSByZXN1bHQgb2YgdGhlIGNvbW1lbnQgbGVmdA0KPiAgIGJ5IENo
dW5mZW5nIFl1biBpbiB2Mw0KPiAtLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91
c2ItaGNkLnlhbWwgICAgICB8IDE0ICsrLS0tLS0tLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL3VzYi55YW1sICAgICAgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi55
YW1sDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi91c2ItaGNkLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L3VzYi1oY2QueWFtbA0KPiBpbmRleCA3MjYzYjdmMmI1MTAuLjgxZjNhZDE0MTlkOCAxMDA2NDQN
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2ItaGNkLnlh
bWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2ItaGNk
LnlhbWwNCj4gQEAgLTksMTggKzksMTAgQEAgdGl0bGU6IEdlbmVyaWMgVVNCIEhvc3QgQ29udHJv
bGxlciBEZXZpY2UgVHJlZSBCaW5kaW5ncw0KPiAgbWFpbnRhaW5lcnM6DQo+ICAgIC0gR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gIA0KPiAtcHJvcGVy
dGllczoNCj4gLSAgJG5vZGVuYW1lOg0KPiAtICAgIHBhdHRlcm46ICJedXNiKEAuKik/Ig0KPiAr
YWxsT2Y6DQo+ICsgIC0gJHJlZjogdXNiLnlhbWwjDQo+ICANCj4gLSAgcGh5czoNCj4gLSAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5DQo+IC0g
ICAgZGVzY3JpcHRpb246DQo+IC0gICAgICBMaXN0IG9mIGFsbCB0aGUgVVNCIFBIWXMgb24gdGhp
cyBIQ0QNCj4gLQ0KPiAtICBwaHktbmFtZXM6DQo+IC0gICAgZGVzY3JpcHRpb246DQo+IC0gICAg
ICBOYW1lIHNwZWNpZmllciBmb3IgdGhlIFVTQiBQSFkNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiB0cnVlDQpUaGlzIHNlZW1zIGFscmVhZHkgYWRkZWQgYnkgdGhlIGFwcGxpZWQgcGF0Y2ggNmEw
ZTMyMWVhNzM1ICJkdC1iaW5kaW5nczoNCkV4cGxpY2l0bHkgYWxsb3cgYWRkaXRpb25hbCBwcm9w
ZXJ0aWVzIGluIGNvbW1vbiBzY2hlbWFzIg0KDQo+ICANCj4gIGV4YW1wbGVzOg0KPiAgICAtIHwN
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNi
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi55YW1sDQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTQxYWQ1OWZiYWM1
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi91c2IueWFtbA0KPiBAQCAtMCwwICsxLDI5IEBADQo+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wDQo+ICslWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy91c2IvdXNiLnlhbWwjDQo+ICskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gKw0KPiArdGl0bGU6IEdl
bmVyaWMgVVNCIENvbnRyb2xsZXIgRGV2aWNlIFRyZWUgQmluZGluZ3MNCj4gKw0KPiArbWFpbnRh
aW5lcnM6DQo+ICsgIC0gR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4NCj4gKw0KPiArc2VsZWN0OiBmYWxzZQ0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiArICAk
bm9kZW5hbWU6DQo+ICsgICAgcGF0dGVybjogIl51c2IoQC4qKT8iDQo+ICsNCj4gKyAgcGh5czoN
Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFy
cmF5DQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICBMaXN0IG9mIGFsbCB0aGUgVVNCIFBI
WXMgb24gdGhpcyBIQ0QNCj4gKw0KPiArICBwaHktbmFtZXM6DQo+ICsgICAgZGVzY3JpcHRpb246
DQo+ICsgICAgICBOYW1lIHNwZWNpZmllciBmb3IgdGhlIFVTQiBQSFkNCj4gKw0KPiArYWRkaXRp
b25hbFByb3BlcnRpZXM6IHRydWUNCj4gKw0KPiArLi4uDQoNCg==

