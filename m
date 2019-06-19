Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86A514C278
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2019 22:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfFSUk3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Jun 2019 16:40:29 -0400
Received: from mail-eopbgr810109.outbound.protection.outlook.com ([40.107.81.109]:11392
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726175AbfFSUk3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Jun 2019 16:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYGV2mKmpvLzG9ddGw8d8CMWFfK2ptzO44WciSnaWlY=;
 b=WBya2Jwaj8JxjLLiKYG3oZNabOpzB5Uua8nnpaimC6gv6Ms6SEolfe0+FZelFRzZXc1SZP0L1CbAOIj0JjGuVCCCR5TK1cPHIWTJAvRBzB7Bk7XOKbexe3EfPl0PWbfPiQ14D0x54446l0vbYUFKPNruPKwAY806lM86DzXBwa0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1517.namprd22.prod.outlook.com (10.174.170.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 20:40:27 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 20:40:27 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Hellermann <stefan@the2masters.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ath79: fix ar933x uart parity mode
Thread-Topic: [PATCH] MIPS: ath79: fix ar933x uart parity mode
Thread-Index: AQHVJRK+PZ26PPw24kGKsW2zjRIhuqajdEyA
Date:   Wed, 19 Jun 2019 20:40:26 +0000
Message-ID: <MWHPR2201MB1277D8FA18055C81FFF193ABC1E50@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190617134359.5968-1-stefan@the2masters.de>
In-Reply-To: <20190617134359.5968-1-stefan@the2masters.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0043.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::20) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ef8b974-9aec-44c7-8332-08d6f4f65c34
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1517;
x-ms-traffictypediagnostic: MWHPR2201MB1517:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB151768099E3C2D102524B817C1E50@MWHPR2201MB1517.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(376002)(136003)(366004)(39840400004)(189003)(199004)(6436002)(68736007)(6246003)(71200400001)(71190400001)(102836004)(26005)(8676002)(186003)(81166006)(74316002)(2906002)(44832011)(64756008)(476003)(66946007)(25786009)(486006)(55016002)(4326008)(8936002)(305945005)(66556008)(73956011)(446003)(6916009)(229853002)(42882007)(33656002)(7736002)(11346002)(81156014)(6506007)(386003)(52116002)(76176011)(6306002)(5660300002)(66446008)(52536014)(9686003)(478600001)(7696005)(66066001)(66476007)(99286004)(256004)(14454004)(4744005)(6116002)(3846002)(53936002)(54906003)(316002)(966005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1517;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TaA6akOky4+MNCnwvhST8yPMsYPTbfVOJOGHviJcioNSoXJLjt14tpqP4nWeu4nl+gf4l6auComj8phju9+hhNwAWKhEiIJbh0Ph8CDbZpZawwuH+Z48pxnfjPmWPTJqlrCoKBtfynU+zotxJK6UsFJn9typd7x8E31ycvAzobnk9U7UGmGsUUJs+wpr2pODJ8E0ijZR6dzHVZEY+cGjDKoI+9vA8iR1bg6WdcZ/KXsFOJ2jO78BSQu80h8Dsg74kXFmpgUnIUypo/9b6JYDfGjb/iLsqAcZtYmXhnPFqmGerrJhoKxcLjrRKkvLH8X/kZ0lR06mo+/ZacVfbhDejumVARyWZZrGdnpnBsxMviwKPwE6rdklPSGIO17soywq6kG6Tedn6SdckfzR4UQWOBW9tBmxCI8hKYAUl4gZYY4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef8b974-9aec-44c7-8332-08d6f4f65c34
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 20:40:26.8583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1517
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClN0ZWZhbiBIZWxsZXJtYW5uIHdyb3RlOg0KPiBXaGlsZSB0cnlpbmcgdG8gZ2V0
IHRoZSB1YXJ0IHdpdGggcGFyaXR5IHdvcmtpbmcgSSBmb3VuZCBzZXR0aW5nIGV2ZW4NCj4gcGFy
aXR5IGVuYWJsZWQgb2RkIHBhcml0eSBpbnN0ZWQuIEZpeCB0aGUgcmVnaXN0ZXIgc2V0dGluZ3Mg
dG8gbWF0Y2gNCj4gdGhlIGRhdGFzaGVldCBvZiBBUjkzMzEuDQo+IA0KPiBBIHNpbWlsYXIgcGF0
Y2ggd2FzIGNyZWF0ZWQgYnkgOGRldmljZXMsIGJ1dCBub3Qgc2VudCB1cHN0cmVhbS4NCj4gaHR0
cHM6Ly9naXRodWIuY29tLzhkZXZpY2VzL29wZW53cnQtOGRldmljZXMvY29tbWl0Lzc3YzU1ODZh
ZGUzYmI3MmNkYTAxMGFmYWQzZjIwOWVkMGM5OGVhN2MNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0
ZWZhbiBIZWxsZXJtYW5uIDxzdGVmYW5AdGhlMm1hc3RlcnMuZGU+DQoNCkFwcGxpZWQgdG8gbWlw
cy1maXhlcy4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8t
Z2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhlbiBw
bGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
