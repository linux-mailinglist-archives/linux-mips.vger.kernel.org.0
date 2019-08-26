Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB5F29CDB3
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 13:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbfHZLEm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 07:04:42 -0400
Received: from mail-eopbgr790090.outbound.protection.outlook.com ([40.107.79.90]:6076
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727138AbfHZLEl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Aug 2019 07:04:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zld8YIUQ6yAiTWTgQ62CimL6/xIyrNGyHVOZr/2VmlYnYfBz+iApJ9aA4iV+ewF4875mmtxvQuoQ0tI3cDyLVYG7y5s72POsnFhJXItU5UWd2QM+DwGsNR9J4tthyp0EKutb7GJARi6icN2m6wsAaxRAj8iZ0mInsitj1gPRKbFwEoZ6TERVjo5mVdCPiDxZNjiSfsXceOL8uN1UnId7EIdeCF98YtFxIxdvoi9ELbsYyEUQWo0rZ2fiJxoaVQrqYHQrNyHimqkYAegyYBazkgmcHZPg2EIyZAcvGLXNDuxVIOHu3SZuaDS6e8beCTSOWo94oabscFPjmqg17QvqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGrY8XdKqaPajZz7a/sU61FP/3wdmutC1zuFkmq0LYo=;
 b=ECryAf7PcAa8Y8PPQYKl09VYwkisoA+EN34f2LWzV47FGzhPxuxy//HeaPbpmywKtVjEVEx72fDE3+tsO8cQ3Eqp20nhaGhw7a68z/abdH+t+3ba4SRPg2TaHIoBvEXIcX4V2NZGJWRDZwFKSE786qjmUPPSnsVcq8L/GvZxNGXIPa0cjwUE8m6AHe4y3hQWZECbrWjDWDyS1jSAIQounFUl+x2Qwg5DVmQs81gY5vF+AdhgipYagbUs2u5NslQVdTOH9m9/KwMM8NvfTn5YEAq1M1P5WmcexOFbMiUfFIlQ6rypCRIiT+B1zarTJnhVEtIs7d9gz7WKLW4NUyXPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGrY8XdKqaPajZz7a/sU61FP/3wdmutC1zuFkmq0LYo=;
 b=VYgiCW/sBDrV4EzSTQazQe0KZuPMmCtRlvOFiSBUd0jwTg9/SnWFknFoTlqZ2yXKTG0pAMdbUcuGkU38cW6Fw+zpkmO4yogmKqUbog1QzLgA22/c4yg4jXf67oRjN9e5n9uqYD6Qm4HTMy8ZTC466QpFJLHr97n8PJBveO8zUa0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1469.namprd22.prod.outlook.com (10.174.170.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 11:04:39 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2199.021; Mon, 26 Aug
 2019 11:04:39 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
CC:     "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "joe@perches.com" <joe@perches.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] firmware: bcm47xx_nvram: Correct size_t printf
 format
Thread-Topic: [PATCH v2 1/2] firmware: bcm47xx_nvram: Correct size_t printf
 format
Thread-Index: AQHVCnvULDo6iaFrb0mu0D1fqju5G6cN5xqA
Date:   Mon, 26 Aug 2019 11:04:39 +0000
Message-ID: <MWHPR2201MB12778655852AC1111F8B0E2CC1A10@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190514173816.17030-1-f.fainelli@gmail.com>
In-Reply-To: <20190514173816.17030-1-f.fainelli@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [79.77.158.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f67973d3-cc5b-4f1a-3d56-08d72a153049
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1469;
x-ms-traffictypediagnostic: MWHPR2201MB1469:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR2201MB1469892E27268779C5FEB4CCC1A10@MWHPR2201MB1469.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(136003)(39840400004)(366004)(199004)(189003)(478600001)(966005)(5660300002)(14454004)(2906002)(229853002)(6436002)(74316002)(6306002)(9686003)(55016002)(25786009)(54906003)(6246003)(53936002)(66946007)(52536014)(7736002)(3846002)(6116002)(4326008)(66446008)(64756008)(66556008)(66476007)(305945005)(316002)(256004)(71190400001)(71200400001)(486006)(44832011)(8676002)(81156014)(81166006)(8936002)(66066001)(186003)(102836004)(99286004)(386003)(6916009)(6506007)(476003)(26005)(11346002)(446003)(42882007)(7696005)(52116002)(76176011)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1469;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +5tDnj1JWKSoye1GaNiSdU00TZR45LIs90LabOl6SIzNoZFbmyWFHHUWWaVgk2pxrGSgzjIBM7GPEstshCH5JnJ1uKH8uF4aq0BzDYqa8ubdl/pwUTOCnsIrilrXQMvIk/XfG6jasVrh9PcBAazTKXTU5CLVS0bF9bZTSZhG3Q1Lp6S462PG3Wd4rmJD5pSRk7zdU1Mv4negRIDu7vAovuSwL714h7sfmfRs5l75ImWKXNgcIJt69c8+t1jOBbSEdVX4BIRTOHcZSF20XwXJO5klMzNPLcRvJ2E99YtKzFBg6RHgjTSIU4g5MZ1BUyO5SwtofsxroJymseWPR0tm+gCPuQ5XUafD+PK+tBHgTfGmiSOf+qdbdBtH0nPiJpeVlv8D7gBlg7lDnSxSElXdT7YdT3K5Tylv7EiiPkr3BGE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67973d3-cc5b-4f1a-3d56-08d72a153049
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 11:04:39.2588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iOGRsggWsmKpm1+8mItftsF39WjuzvOEJsRoS9lirLTOkK+OfN2QehuJa3qtk7Bk8rADshPeCVFESeGGek4CgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1469
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCkZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6DQo+IFdoZW4gYnVpbGRpbmcgb24gYSA2
NC1iaXQgaG9zdCwgd2Ugd2lsbCBnZXQgd2FybmluZ3MgbGlrZSB0aG9zZToNCj4gDQo+IGRyaXZl
cnMvZmlybXdhcmUvYnJvYWRjb20vYmNtNDd4eF9udnJhbS5jOjEwMzozOiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8gJ3ByX2VycicNCj4gICAgcHJfZXJyKCJudnJhbSBvbiBmbGFzaCAoJWkg
Ynl0ZXMpIGlzIGJpZ2dlciB0aGFuIHRoZSByZXNlcnZlZCBzcGFjZSBpbiBtZW1vcnksIHdpbGwg
anVzdCBjb3B5IHRoZSBmaXJzdCAlaSBieXRlc1xuIiwNCj4gICAgXn5+fn5+DQo+IGRyaXZlcnMv
ZmlybXdhcmUvYnJvYWRjb20vYmNtNDd4eF9udnJhbS5jOjEwMzoyODogbm90ZTogZm9ybWF0IHN0
cmluZyBpcyBkZWZpbmVkIGhlcmUNCj4gICAgcHJfZXJyKCJudnJhbSBvbiBmbGFzaCAoJWkgYnl0
ZXMpIGlzIGJpZ2dlciB0aGFuIHRoZSByZXNlcnZlZCBzcGFjZSBpbiBtZW1vcnksIHdpbGwganVz
dCBjb3B5IHRoZSBmaXJzdCAlaSBieXRlc1xuIiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfl4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgJWxpDQo+IA0KPiBVc2UgJXp1IGlu
c3RlYWQgZm9yIHRoYXQgcHVycG9zZS4NCg0KU2VyaWVzIGFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0K
DQo+IGZpcm13YXJlOiBiY200N3h4X252cmFtOiBDb3JyZWN0IHNpemVfdCBwcmludGYgZm9ybWF0
DQo+ICAgY29tbWl0IGZlYjRlYjA2MGMzYQ0KPiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbWlw
cy9jL2ZlYjRlYjA2MGMzYQ0KPiAgIA0KPiAgIFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gRmFpbmVs
bGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPg0KPiAgIFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDg8KpIDxmNGJ1Z0BhbXNhdC5vcmc+DQo+ICAgU2lnbmVkLW9mZi1ieTogUGF1bCBC
dXJ0b24gPHBhdWwuYnVydG9uQG1pcHMuY29tPg0KPiANCj4gZmlybXdhcmU6IGJjbTQ3eHhfbnZy
YW06IEFsbG93IENPTVBJTEVfVEVTVA0KPiAgIGNvbW1pdCA1Njk5YWQwYWFmMTANCj4gICBodHRw
czovL2dpdC5rZXJuZWwub3JnL21pcHMvYy81Njk5YWQwYWFmMTANCj4gICANCj4gICBTaWduZWQt
b2ZmLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4NCj4gICBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIEJ1cnRvbiA8cGF1bC5idXJ0b25AbWlwcy5jb20+DQoNClRoYW5rcywN
CiAgICBQYXVsDQoNClsgVGhpcyBtZXNzYWdlIHdhcyBhdXRvLWdlbmVyYXRlZDsgaWYgeW91IGJl
bGlldmUgYW55dGhpbmcgaXMgaW5jb3JyZWN0DQogIHRoZW4gcGxlYXNlIGVtYWlsIHBhdWwuYnVy
dG9uQG1pcHMuY29tIHRvIHJlcG9ydCBpdC4gXQ0K
