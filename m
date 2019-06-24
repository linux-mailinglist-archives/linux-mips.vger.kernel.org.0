Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9FB151CF1
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfFXVQU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:16:20 -0400
Received: from mail-eopbgr790098.outbound.protection.outlook.com ([40.107.79.98]:40672
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732238AbfFXVQT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioKJlOgcKFPmaaxA5b6kvCxQCcdd8pY4gOZjlsaaTNs=;
 b=ShJG73oHjl7gXHq+xaDCq5kPZOYSvpUXVyGDFdLqc0T/2CcFQ+/9HyAgtkwbxC8JZlLOWTgeNZsQ2aeFkLKmSW4Lo8pD9H6AaR9EcmKsiu/pJpS5xXHHxcaBRuKLGyfLhv40eFBA5bS9Z3SQ7dWrrHVhEHP/lhao1yfumWB+3Hc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:16:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:16:17 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 3/8 v2] MIPS: ralink: mt7628a.dtsi: Add pinctrl DT
 properties  to the UART nodes
Thread-Topic: [PATCH 3/8 v2] MIPS: ralink: mt7628a.dtsi: Add pinctrl DT
 properties  to the UART nodes
Thread-Index: AQHVKtIPDZdsxOInXky5y0N9awdhOg==
Date:   Mon, 24 Jun 2019 21:16:17 +0000
Message-ID: <MWHPR2201MB127740BC14BA1D9927380501C1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190527091323.4582-3-sr@denx.de>
In-Reply-To: <20190527091323.4582-3-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46a3d379-e73c-4ed1-fd9c-08d6f8e93244
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB137558E302857A392EE68C40C1E00@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39840400004)(366004)(136003)(189003)(199004)(186003)(305945005)(26005)(3846002)(11346002)(33656002)(446003)(81166006)(81156014)(8676002)(6916009)(54906003)(99286004)(14454004)(102836004)(386003)(6506007)(2906002)(25786009)(4326008)(8936002)(6116002)(66066001)(9686003)(476003)(66556008)(66446008)(52116002)(53936002)(64756008)(73956011)(7696005)(4744005)(66476007)(42882007)(66946007)(6436002)(316002)(74316002)(6246003)(71190400001)(71200400001)(5660300002)(486006)(52536014)(7736002)(256004)(68736007)(55016002)(478600001)(44832011)(229853002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8Tqe8zm/hmbQ7ytW0LtsD6bxITmgovVEARxG/ozkrXldbI2IdAvpv9J4qZagrfM2EuvFyO/DvJyUzq1PTU3dk9vLPOCiiVnNnvURuknCST+CZyMU8WmxV1P94ZTQOANgmax/v+kubHIsSta65rHEFfuelZgRiLa394nh8V4+1RyBuS89Z4mFirEVAxJKXDacCrrJYJcfR6+T41a+SIP9bEv7M5Vw0BRMvHzYQqb/xaPONql9hYvqH992kCUCOswHceFtMdTfH7yC/qm6HwHKMcHmx7GoYrlszjF1P1BmJez/XB0nxfeaoSu9zYcRQTT+n6rxmMSANJV2vYTVW0s3BvGbyEZ9z2ovnztOVkzl+1wf/gCNIcysk/zXSSFjCptC2xpPbHpFeoLhYIjIvkp9uiQC2C+qW2chqW13sGeycbk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a3d379-e73c-4ed1-fd9c-08d6f8e93244
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:16:17.6136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1375
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClN0ZWZhbiBSb2VzZSB3cm90ZToNCj4gTm93IHRoYXQgcGlubXV4IGlzIGF2YWls
YWJsZSwgbGV0J3MgdXNlIGl0IGZvciB0aGUgVUFSVCBEVCBub2Rlcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4NCj4gQ2M6IFBhdWwgQnVydG9uIDxwYXVs
LmJ1cnRvbkBtaXBzLmNvbT4NCj4gQ2M6IEhhcnZleSBIdW50IDxoYXJ2ZXlodW50bmV4dXNAZ21h
aWwuY29tPg0KPiBDYzogSm9obiBDcmlzcGluIDxqb2huQHBocm96ZW4ub3JnPg0KDQpBcHBsaWVk
IHRvIG1pcHMtbmV4dC4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2Fz
IGF1dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAg
dGhlbiBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
