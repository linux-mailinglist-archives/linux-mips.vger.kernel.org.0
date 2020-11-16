Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BD92B4239
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 12:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbgKPLHG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 06:07:06 -0500
Received: from mail-eopbgr70135.outbound.protection.outlook.com ([40.107.7.135]:16558
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726353AbgKPLHF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 06:07:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMgVB8opX1i1ycODWRbP/mhzTuvIyD6dW3C5GUWz3W0kqNisiwz3Ss2WyhGgBfpuNPx8Xo7b3CZtmJflZnW7fL/f97IcWA7FDLZ0O7nSMmT9wmc1yjQSEkGR0RuNWqI6y6YGBF6ZXInr3EACda2slrDNCBeayKdA8cyl+Tdixf/K5Z/s2iJhYEYUyBZfQa8BS3ELwFDCXj+mC6F61MjB9uZ+mb9tQfZ5QBQgnv6v4j9yPNBfxdbnja7MfsdEDlFiW1qriu5vTwzMsmIEqegKL80sBc0nWXw+mTWMmdiyHZ1qSfrOwVrfm1Y/5+dEJuYEIVKC52/fvrcpdDS7S2jHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RcKy3SDft3VVlEuBpjinNagKiTiw+2n+PnCsCwBMlU=;
 b=noiG7ZbOFB/zz45eA6/vxGot2PUW67p/xv5Y/DE/QQouKUMsIPAEdWvLpMjPIzbGTFRh2O/RC0RD9laE/mN0KlTuStMnFFV62wxDg1AzsiBfnqF3203azcXcB+FNA6fE0qtxeNTLnKcbF5MBtVvcMs+piWmbyTdrFqPm3WiM8e+k/Juur6NFd/qEv/lszi+fw2xHaP7B8X2XnEnGAtTJtiH1jY+3DZn/StA6n2SsNksXw9Lj12NblYJRwozSAaoHNITn9S9sx8zVB1AOjjlnmnfQ7IVTJJkNgoAfERiydmdfO4b/tHsXLGKYHSTFjgPbt1BKUCRHgQvJDDfI7CIhUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RcKy3SDft3VVlEuBpjinNagKiTiw+2n+PnCsCwBMlU=;
 b=GMZzcWGT6Vi5hNGDf49yDGi4SeLKhqzT3ZU0Y1BzDDHvt81u36GIT8NqzAMyVFS2w9KfpX+M2TscQO5N6omgk5up1Zxi+R3UQHWV6LNVThy8C0s8BWiQWutJJfpk6Ei7psX++gWn3ISqdgxtvELmTRo+igufFD5kCqQFsHjx6yU=
Received: from VI1PR0301MB6655.eurprd03.prod.outlook.com
 (2603:10a6:800:19c::8) by VE1PR03MB5392.eurprd03.prod.outlook.com
 (2603:10a6:802:a2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 11:07:00 +0000
Received: from VI1PR0301MB6655.eurprd03.prod.outlook.com
 ([fe80::216f:196f:cc77:1fe6]) by VI1PR0301MB6655.eurprd03.prod.outlook.com
 ([fe80::216f:196f:cc77:1fe6%5]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 11:06:59 +0000
From:   Miodrag Dinic <Miodrag.Dinic@syrmia.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: RE: [PATCH 2/2] MAINTAINERS: Set myself as Goldfish RTC maintainer
Thread-Topic: [PATCH 2/2] MAINTAINERS: Set myself as Goldfish RTC maintainer
Thread-Index: AQHWuodtusWq9FPmB02FIVpt0SpZnanH8gMAgAKpjvA=
Date:   Mon, 16 Nov 2020 11:06:59 +0000
Message-ID: <VI1PR0301MB6655CE868F5A472261C1435F94E30@VI1PR0301MB6655.eurprd03.prod.outlook.com>
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
 <20201114130921.651882-3-jiaxun.yang@flygoat.com>
 <6bcbba2a-5a75-9b07-1816-edf6fb77a664@gmail.com>
In-Reply-To: <6bcbba2a-5a75-9b07-1816-edf6fb77a664@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [24.135.192.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56c9fe6f-7ead-4b90-92e4-08d88a1fbd5a
x-ms-traffictypediagnostic: VE1PR03MB5392:
x-microsoft-antispam-prvs: <VE1PR03MB53924113B5D9717C03853AE294E30@VE1PR03MB5392.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GQbRiDr2K9P8y+WkW8Har1PshTS1ZTU72VH+Yk9kssTulu5Qr42UpZkbDY49CcDLLE/0OgcslmeZh/QbWi25aYJFdf+ApV7CK9zWHsqT36iQ3ubsFA0M6OU63aH3N35N0ytV1C1pffd92ccgZSjNr13ovbIj8kxRO7I/VDfMHZU7jnu26PchfpF9LQrVfeWBNhrF91G4Z1GAAYC+Etvg6fiUPz+7huYfMoO+gc01zQOEv5fwrp6IIOWT0GKX3QOgH4qn1SOnJV6wk8kCfbUvqyd9c4r8JScaDMfuvNFD1kUc2hdIPYawVnh3iYwCKs4GpKZcnrr86UwiJcolityHKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0301MB6655.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(39830400003)(396003)(346002)(26005)(4744005)(66946007)(66476007)(66446008)(4326008)(64756008)(86362001)(76116006)(66556008)(53546011)(9686003)(55016002)(54906003)(110136005)(478600001)(2906002)(6506007)(186003)(7696005)(316002)(52536014)(5660300002)(33656002)(71200400001)(8676002)(8936002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: QIWBBaafnD3pmbXKki6bO/XvYzHWFtbcnCeJCklmAqHc1ACO5wefDYBOREvk11plqJt9zNKYkp13+1CyHFJdkuzYv/DPaRqeW4Rtw4Ee/yxTFlgGFl0y7iL86ENVXV+EiQQ6qGjITscXCP32sWZTpKqZ2UP92+Fn9f+i3TCD8tNpqbX7QV9S6ZD07j2DJbCRrKfeRvDV3g5Iga62OJnnLxJTpkvcErJejUnrUphTaC+9EFrWXEshu0TZsEpqAax6Fuo0GSbwo1/UAdios0XtTE14q6R9rNl+tds7EE+Lw1Yctjlu0MBFU5hQFT0aAmSQ6rNLg62bsBEFoM08Xg8V5XNXhCoCG3yuF/Wsb5phX+G8AyF+ZkDoQsFNMT+Sn7E9w3vBk7DunGt+kIww9cjYg95qGSvTK7CO2QtpOCitqYpgKO324EA6av4VfqUhz5vSZaoZjoWeIBjZFnwM4b1R4BZ9pEa1xyg2y/vYhIt/27XNXWhOSQRrK//mSVqlAez7W+uRGVIe4H7JvGhgJIdJrIVXhcmnmZypHA3VuStn3ajOECT3AHGxlpEdah9mUut9radXvEABd/h/7OZCO+eTZZjjqucdjvftBejt2nnS33HJTMyBZWjzD962JVPdpmSi3nNoBKXMVsEFdXMX3LAzsH+eMbDUFyb4gotPUKvsrTQU05dgsAMn8tdi77NzafOEVd7qW3MDRTgFH/i8h6A2cMncGXG+nVqCqVXeRYJ8nQEoYO/sfnJPokI2dNsSqNgyLjhsLxzogtvnye6pGtLOF3N7GOKMWcf9OrF8k4bd96Y8gmBMZN2COJUOxbFTc4y3rEJaCEMuRH//Y0XEJVU2SYQBKPWTn6SKc3JnO5XUPPNQrfvsnB3fxZbmqzJ3XieaSatTh/W4mRI8y0zzZCSdXQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0301MB6655.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c9fe6f-7ead-4b90-92e4-08d88a1fbd5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 11:06:59.6691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jXZe6yzPH0Zoo2ol6AgRJHH5zovcPGHa9cDwRsjj4phPqlen0d6U/vQ/Vy1x4gZfDcjZ1tla95ke7owMMCaILaavV4RKtczyHwzBKUwiT2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5392
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGksIEknbSBnbGFkIHRvIHNlZSB0aGF0IHRoZSBjb2RlIGlzIHN0aWxsIGluIHVzZS4gVGhhbmtz
IGZvciBub3RpZmljYXRpb24sIGZlZWwgZnJlZSB0byB0YWtlIG93bmVyc2hpcCBhbmQgY29udGlu
dWUgZGV2ZWxvcG1lbnQvbWFpbnRlbmFuY2Ugb2YgdGhpcyBjb2RlLg0KDQpLaW5kIHJlZ2FyZHMs
DQpNaW9kcmFnDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTZXJnZWkgU2h0
eWx5b3YgPHNlcmdlaS5zaHR5bHlvdkBnbWFpbC5jb20+IA0KU2VudDogU2F0dXJkYXksIE5vdmVt
YmVyIDE0LCAyMDIwIDc6MjYgUE0NClRvOiBKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29h
dC5jb20+OyBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZw0KQ2M6IE1pb2RyYWcgRGluaWMgPE1p
b2RyYWcuRGluaWNAc3lybWlhLmNvbT47IEFsZXNzYW5kcm8gWnVtbW8gPGEuenVtbW9AdG93ZXJ0
ZWNoLml0PjsgQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29t
PjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtcnRjQHZnZXIua2VybmVsLm9y
Zw0KU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIE1BSU5UQUlORVJTOiBTZXQgbXlzZWxmIGFzIEdv
bGRmaXNoIFJUQyBtYWludGFpbmVyDQoNCkhlbGxvIQ0KDQpPbiAxMS8xNC8yMCA0OjA5IFBNLCBK
aWF4dW4gWWFuZyB3cm90ZToNCg0KPiBXaGlsZSBHaWxkZmlzaCBwbGF0Zm9ybSBpcyBkdXN0ZWQs
IHRoZSBSVEMgZHJpdmVyIHJlbWFpbnMNCg0KICAgR29sZGZpc2guIDotKQ0KDQo+IHZhbHVhYmxl
IGZvciB1cy4NCj4gDQo+IEknbSB2b2x1bnRlZXJpbmcgdG8gbWFpbnRhaW4gZ29sZGZpc2ggUlRD
IGRyaXZlciBvbndhcmQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKaWF4dW4gWWFuZyA8amlheHVu
LnlhbmdAZmx5Z29hdC5jb20+DQo+IENjOiBNaW9kcmFnIERpbmljIDxNaW9kcmFnLkRpbmljQHN5
cm1pYS5jb20+DQpbLi4uXQ0KDQpNQlIsIFNlcmdlaQ0K
