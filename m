Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B827AE40
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 18:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbfG3Qok (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 12:44:40 -0400
Received: from mail-eopbgr820090.outbound.protection.outlook.com ([40.107.82.90]:4608
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725974AbfG3Qok (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Jul 2019 12:44:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+oFrwQLt0Xva2BgeyxuWhnuqL7joSUUgcb2Rnq2jniOXpbzexbRNLm/mwzSN8MgWmkHSgkLiydBYq8Xa1zSNxP7q6+nsegGQZaiEW+iGXWJvK065T2DA8QQoODK4nYufhQCi4Z6vMsJdeotmk1CCmVj7Ja3xWZ30ZEtOdKSndhRVe4asgRQT7iDdHsgGYk0Z5Hb3m2E24jrhrjghMKd0mwjiM5E1wmKiSHNV7wgP+D86HjeJzwKOq9hFkq6hxwKGIM/uZdUKk+JnQ/N2JBhzXqEz5AOCmpd3v90fUO5cBpYalWVgiRurPRufJ5t2p9+SPS8x7Tnc8dXiFqD1JVhAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3t23GfowLZj+KeHVtfVf6R7T/aot3o2MYKgA/8ghn4=;
 b=iYVBM2a07N2LESZssONZ/VQrkkBiPapi5y9Adn1wer9SnvqMg6Pudjx0aly0EXXxj4igQyZbZzCM2n9YWjmIraREaehMcEo/xrV+AihelKA1PfDt2BVGFxM3myhdfgDph9JumnEZ7U4CmFXWC95230Lst5HhtV4qTSAlb2P2nB03UkV9d64OOVUkUapsTtsy2R/VQr/38rKMFRGSc/00xAMgpRE0ntrgtOe0a/sIq2nTW35oHsNADF0tYm3rzPCKa94irUGeeclGraFOVNIP031qH9pEQNAdxANJzYsOGwkoaanH6CgLYNLx6di4eRFWT8xCf9xTketHdQi9WZy8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3t23GfowLZj+KeHVtfVf6R7T/aot3o2MYKgA/8ghn4=;
 b=XjO1mwP23QC8R4+2h0Fux9pLUrFWK+HMgCNAo5/4KyfohjQ8K2hrgzQTSyTHULDFV74jV4Z1jKwsPxYXYQf9z1ukRy8oSc1pGRHi90TXpU+3wlL77vWAgYCcG3y/5nNY6QbzdSVfy1vJhRbJH+G/T2CogfN5g0zWST4cmfFeOeo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1453.namprd22.prod.outlook.com (10.174.170.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 16:44:36 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 16:44:36 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "armijn@tjaldur.nl" <armijn@tjaldur.nl>,
        "syq@debian.org" <syq@debian.org>,
        "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: X1000: Add X1000 system type.
Thread-Topic: [PATCH] MIPS: X1000: Add X1000 system type.
Thread-Index: AQHVRvYS8jpLqA4gWEuOGoKwIzs3Jg==
Date:   Tue, 30 Jul 2019 16:44:35 +0000
Message-ID: <MWHPR2201MB127779F205FB507B594A684DC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1564486211-2699-2-git-send-email-zhouyanjie@zoho.com>
In-Reply-To: <1564486211-2699-2-git-send-email-zhouyanjie@zoho.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::30) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 621b5d1a-b95f-46ff-93b1-08d7150d3463
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1453;
x-ms-traffictypediagnostic: MWHPR2201MB1453:
x-microsoft-antispam-prvs: <MWHPR2201MB1453C7553891B68E0C8CF1A7C1DC0@MWHPR2201MB1453.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(366004)(346002)(39850400004)(189003)(199004)(68736007)(6506007)(386003)(229853002)(76176011)(33656002)(8676002)(25786009)(81156014)(81166006)(42882007)(71200400001)(71190400001)(478600001)(102836004)(186003)(4326008)(14454004)(26005)(316002)(7736002)(55016002)(53936002)(74316002)(305945005)(66446008)(64756008)(66946007)(66556008)(66066001)(7416002)(99286004)(7696005)(52116002)(558084003)(66476007)(6246003)(6436002)(54906003)(9686003)(6916009)(446003)(486006)(2906002)(5660300002)(476003)(44832011)(52536014)(6116002)(11346002)(8936002)(256004)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1453;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jk4MTMLeq+Xqj8b5K1TjbeFDXt7pfjb8S9Oenkp4jyLi0deLQEFVhpEFmQYowNWXWuOfkBGcS4l4khL15/yZrMapDeYaTvNIy0u0zUvxTqoYy1U63D5or6xKk/0USPLh6qOSzE2Yv9xfsTA56TNxtICSAQ+vA3NCq6x3hnUl7yMMRmtGYN9wUwKaM83NimPfMcx3OasAxARQ+JsqzpZUZ4llL1+JB2FkrC11hDvuUkJQYswFBxf22bbmpbUEWyX++pjagkOzb1PLpwBmEHbA9qYyTott4o4km5Nl/22+ebf3ed7bPYeYmOTLPD2+9ap8cPkdt50dXoTAt5vclM64e8Q/G2NIXx4hDKFnovgHK/Uv6dbsLqemu2pFSbKdURLrIaj80WrWwLdieHVzygWh2l8MxLWWQDKre7jlksruyj0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621b5d1a-b95f-46ff-93b1-08d7150d3463
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 16:44:35.8397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1453
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Zhou Yanjie wrote:
> Add X1000 system type for cat /proc/cpuinfo to give out X1000.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
