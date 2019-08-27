Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 469259F460
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 22:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbfH0UlP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 16:41:15 -0400
Received: from mail-eopbgr770109.outbound.protection.outlook.com ([40.107.77.109]:54352
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726332AbfH0UlO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 16:41:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDKX8glMUQ0GbnBrGgyTouReap6AnvAM5B/hCKmX6825QZ9OlUzFAdlTuzmFE8pHuUs+L/SZYY2VkukRb9yCt81VBgm5rYNHlSCrc8UHK7EyKYclq/kvZOeWOXNkFVujulG8ew5kjLoYaXd1bbKM4qKuyB2k6jyYCf4GloNEdNG+mv8wVLFyw7qZNu7L79Eb4XlTZlYLmghyBQ2lY6Di4ITI0iVky/2xxAeGj50mAKafGqmkEMFmEbx4z/xAhwYxp8kSheVMsOetSG1AWRmpLuAvLR6Uzl+xGxFuNmccp0cKCiBKt1QAgLES4NqR1FawQrIa518QO5eukOMMnBTCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbWz1QM7X+5spHSl+LwOYGYzoYjNy005Txu4QMnlP3o=;
 b=Yt7XiCiMKH3bXNZ5PhpapfRCbl3PB+F5UIEgQGHWl9kgxDYay4LzXzoY/cqnBv2wRmycSb4XR6RITe5xLcB4eBEldsyOFm3+RBhiFfwvXZec7RuL4I8mO8AWVhtCI24CEWZRh+g9rVWi+Jp67LgRGx7z0zyuHZlhu6s4YRYd2QzlGPtb08c4+S2SDiHHGvbhvFd7aiXPPzdSQolROvsc4ibi7p93tAfmsdlzlxjjupcSsS+Km97Miy+TtBvjxVxROBOeAVJRZcgGfI9/zpg6kIlsWYJc7NdhTKlBAxCJwgOo9dgwBcKnllQ4b0bX05C+6NueEvm6DJlnvtBE7WzXEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbWz1QM7X+5spHSl+LwOYGYzoYjNy005Txu4QMnlP3o=;
 b=OY10YckGuGw9eQdRFXZW5q6ckxkulKpHbkcuHFb5Y+8mXn463/gUuH/dHN+CErut4AMt1vX/lCo90MC4hwXzvohhwsoB7L5qwfZu+UstP3wVdg7OhpD8XJ2XSQsSEftknmsLzDvwB1SNzcr/Z3O4hORfN4FfcJ4B76qPizEc1QM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1469.namprd22.prod.outlook.com (10.174.170.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Tue, 27 Aug 2019 20:41:11 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2199.021; Tue, 27 Aug
 2019 20:41:11 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.co>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Thread-Topic: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Thread-Index: AQHVXRfCtuxS9b9w7ESa0feRfCmKMg==
Date:   Tue, 27 Aug 2019 20:41:11 +0000
Message-ID: <20190827204105.7nyt4pi7lvxse5ij@pburton-laptop>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-12-jiaxun.yang@flygoat.com>
 <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
 <d94eff2b-76ec-5cd2-512d-5ee0406a1bb9@flygoat.com>
In-Reply-To: <d94eff2b-76ec-5cd2-512d-5ee0406a1bb9@flygoat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:8519:dc48:d16b:70fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34b616aa-42a5-4c6c-7fcc-08d72b2ee531
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1469;
x-ms-traffictypediagnostic: MWHPR2201MB1469:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MWHPR2201MB14693861B542D8C400BBA31AC1A00@MWHPR2201MB1469.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(376002)(346002)(136003)(366004)(396003)(199004)(189003)(5660300002)(46003)(14454004)(7416002)(25786009)(229853002)(6436002)(6306002)(6512007)(9686003)(1076003)(6246003)(54906003)(478600001)(966005)(66946007)(66556008)(53376002)(66446008)(66476007)(64756008)(4326008)(6116002)(305945005)(7736002)(316002)(256004)(76176011)(52116002)(486006)(44832011)(8676002)(14444005)(81156014)(81166006)(58126008)(8936002)(53936002)(2906002)(6916009)(33716001)(102836004)(99286004)(186003)(386003)(6506007)(53546011)(476003)(6486002)(71190400001)(71200400001)(446003)(11346002)(42882007);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1469;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LVrlZ5gwuiei9KAwFhfxhwDtz8AO5K1Do7fCqVqHBHS3gvhZVwkZAdV+l0YiSeG8Z+QBKr4XcxrTUZ+VD2SRdHHz0yfrUqgaxsC9EOa1Fxlyt8/umtgjtILFBID/cN7Pa4eS8sxrhBP25eloUjhz91MamwZGgVZ6VNii4bqX7DeWUXMd9JIUPiry6pMzeTWh5hXXcLw3Px8NxmvLCVjQR6ohRdw9Kx+W4rDfiYMFhSt8Zw2vAD58/uK8iU1fw0M+wMwOI92CfyOvIgAKJ/oWzyF9iNW2xsMa4r/WBPMPUMWbADpaJSatcd2mZZxr5Q7pnOYuZ8SIy/gbnejcpWnA+9Kn34rTueFAVNc/NyXc8h/Z8EYeCcP+SSHnN2UZ5X0pUaoNLhgWs2Ra3lZmZkpBxRw3XoPYit0QuLliGZCFaJQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <12ECD8C448368C468E9C13D363C21C2D@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b616aa-42a5-4c6c-7fcc-08d72b2ee531
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 20:41:11.1770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uSkajUcXf40OGkua/2ZzowIGrK8CGfrdyaIsomZ+K01nmgsROlaIwbe8AvnpwGU/1cZOtNBYkytpTmr/6UvBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1469
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgZ3V5cywNCg0KT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTA6MTg6NDZQTSArMDgwMCwgSmlh
eHVuIFlhbmcgd3JvdGU6DQo+IE9uIDIwMTkvOC8yNyDkuIvljYg4OjQ1LCBSb2IgSGVycmluZyB3
cm90ZToNCj4gPiBPbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAzOjU1IEFNIEppYXh1biBZYW5nIDxq
aWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4gd3JvdGU6DQo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pcHMvbG9vbmdzb24vY3B1cy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pcHMvbG9vbmdzb24vY3B1cy55YW1sDQo+
ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi40MTBk
ODk2YTAwNzgNCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9taXBzL2xvb25nc29uL2NwdXMueWFtbA0KPiA+ID4gQEAgLTAs
MCArMSwzOCBAQA0KPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4g
PiBEdWFsIGxpY2Vuc2UgZm9yIG5ldyBiaW5kaW5ncyBwbGVhc2U6DQo+ID4gDQo+ID4gKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gDQo+ID4gPiArJVlBTUwgMS4yDQo+ID4gPiAr
LS0tDQo+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9taXBzL2xvb25n
c29uL2NwdXMueWFtbCMNCj4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiA+ICsNCj4gPiA+ICt0aXRsZTogTG9vbmdzb24gQ1BV
cyBiaW5kaW5ncw0KPiA+ID4gKw0KPiA+ID4gK21haW50YWluZXJzOg0KPiA+ID4gKyAgLSBKaWF4
dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+DQo+ID4gPiArDQo+ID4gPiArZGVzY3Jp
cHRpb246IHwrDQo+ID4gPiArICBUaGUgZGV2aWNlIHRyZWUgYWxsb3dzIHRvIGRlc2NyaWJlIHRo
ZSBsYXlvdXQgb2YgQ1BVcyBpbiBhIHN5c3RlbSB0aHJvdWdoDQo+ID4gPiArICB0aGUgImNwdXMi
IG5vZGUsIHdoaWNoIGluIHR1cm4gY29udGFpbnMgYSBudW1iZXIgb2Ygc3Vibm9kZXMgKGllICJj
cHUiKQ0KPiA+ID4gKyAgZGVmaW5pbmcgcHJvcGVydGllcyBmb3IgZXZlcnkgY3B1Lg0KPiA+ID4g
Kw0KPiA+ID4gKyAgQmluZGluZ3MgZm9yIENQVSBub2RlcyBmb2xsb3cgdGhlIERldmljZXRyZWUg
U3BlY2lmaWNhdGlvbiwgYXZhaWxhYmxlIGZyb206DQo+ID4gPiArDQo+ID4gPiArICBodHRwczov
L3d3dy5kZXZpY2V0cmVlLm9yZy9zcGVjaWZpY2F0aW9ucy8NCj4gPiA+ICsNCj4gPiA+ICtwcm9w
ZXJ0aWVzOg0KPiA+ID4gKyAgcmVnOg0KPiA+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ID4gKyAg
ICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gKyAgICAgIFBoeXNpY2FsIElEIG9mIGEgQ1BVLCBDYW4g
YmUgcmVhZCBmcm9tIENQMCBFQmFzZS5DUFVOdW0uDQo+ID4gSXMgdGhpcyBkZWZpbml0aW9uIHNw
ZWNpZmljIHRvIExvb25nc29uIENQVXMgb3IgYWxsIE1JUFM/DQo+IA0KPiBDdXJyZW50bHkgaXQn
cyBzcGVjaWZpYyB0byBMb29uZ3NvbiBDUFUgb25seSwgYXMgb3RoZXIgcHJvY2Vzc29ycyBtYXkg
dXNpbmcNCj4gZGlmZmVyZW50IG1ldGhvZCB0byBleHByZXNzIENQVSBtYXAuDQo+IA0KPiBEaWZm
ZXJlbnQgZnJvbSBBcm0sIE1JUFMgZmFtaWx5IG9mIHByb2Nlc3NvcnMgc2VlbXMgbGVzcyB1bmlm
b3JtIGFuZCBoYXZlDQo+IHRoZWlyIG93biBkZXNpZ25zLg0KPiANCj4gRm9yIHRoaXMgcG9pbnQs
IHdlJ2QgYmV0dGVyIGFzayBQYXVsJ3Mgb3Bpbmlvbi4NCg0KSW4gZ2VuZXJhbCBvbiBNSVBTIHdl
IGRldGVjdCBDUFUgcHJvcGVydGllcyBhdCBydW50aW1lIGZyb20gY29wcm9jZXNzb3INCjAgcmVn
aXN0ZXJzICYgc2ltaWxhciBzb3VyY2VzIG9mIGluZm9ybWF0aW9uLCBzbyB0aGVyZSdzIG5vdCBy
ZWFsbHkgYQ0KbmVlZCB0byBzcGVjaWZ5IGFueXRoaW5nIGFib3V0IHRoZSBDUFUgaW4gZGV2aWNl
dHJlZS4gRm9yIGV4YW1wbGUgaGVyZQ0KeW91IHNheSB5b3Vyc2VsZiB0aGF0IHRoZSB2YWx1ZSBm
b3IgdGhpcyBwcm9wZXJ0eSBjYW4gYmUgcmVhZCBmcm9tDQpFQmFzZS5DUFVOdW0gLSBzbyB3aHkg
c3BlY2lmeSBpdCBpbiBEVD8NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg==
