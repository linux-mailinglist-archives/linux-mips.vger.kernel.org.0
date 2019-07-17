Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E30C36BF60
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 17:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfGQP6J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 11:58:09 -0400
Received: from mail-eopbgr810119.outbound.protection.outlook.com ([40.107.81.119]:47840
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbfGQP6J (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 11:58:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYL9kVFA1LPJV6FTa+Hq6kLpw5N/vU3Qm0QJx0bg01t4aBN9/fXA32cEbZsMqLr48+D2RGhOoCTlQlqG0XgC/Pt5sWZefJvuiKTr1f6GXE64/UyraDZJPDSPBATn9NYlINeNoyzfhk+JwG7YI7bRsEGd7Ev2fgjdcLqwVc14s7bYs/pkJvup/I1ZbyWDdZqODcNbwzDCB1gdx65SRQYjEl1ttgaAFCnS247WqHBvYu0TS6/1W+zkBIIOro6y7WbTyENrlWMJcje5x92+UsZd073eaZBiFdIP9zIgFNiAHcoFfiHvIsfqielP3ZaILGAsfl4oC6fjh/JtJPKs8sENsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhscU7L2rvp66zHyLIjDKzmnOFZOw7I6gIoyXCgRAYA=;
 b=QV62e0+PTrHTO+mFcxgtTAVyZsFkyD9eiG7nrgUdmHfEUNkMRkmkQrYHa+9ifJv9dq/k1S9KoqcM/+K/X1vexOKOvYZzoylXD8MtBgrig9lRrEtQLCIwOlpVAG2H144wGrtH+vjSC64jgJ1W4TOY/Ee4K7VsFRERezRt9vKEEmx2390eqDKS2IrBZS77PRdmppJDTCDCxD0/jeSAslmF1wngE5j9/83XYoBfZDpGvMMo8MZ6h6XVAmhQTdHwVH0ncdYEcdt722IPI8BkbwZK630E3c12wRqEvIcIKOrUc8zP2y2NRyzTN5HnQ+ttBSAS9fPvBF6FLVqtAKppflW8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhscU7L2rvp66zHyLIjDKzmnOFZOw7I6gIoyXCgRAYA=;
 b=DWfblLheofL6j5yw+vRGQ2C1ZodsTqYbBGONsh4oECy0BgQY/nDniytPP8ZasoEIQmkOpVT5PBc+QgRO26HbmaDWjhsE4gLVNQgbztByO3cPSSoL7ubHPEvhSlyqDwg4yyQeLX8n8myq5ZLk9nchGboVRYXbfAsaO0RgQbcmo38=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1182.namprd22.prod.outlook.com (10.174.169.158) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Wed, 17 Jul 2019 15:58:05 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 15:58:04 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: kernel: only use i8253 clocksource with periodic
  clockevent
Thread-Topic: [PATCH] MIPS: kernel: only use i8253 clocksource with periodic
  clockevent
Thread-Index: AQHVPLhql2QLqBjpuEG6GdBdno1n+A==
Date:   Wed, 17 Jul 2019 15:58:04 +0000
Message-ID: <MWHPR2201MB1277B6A6EB020E4E38329373C1C90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190513114725.17823-1-tbogendoerfer@suse.de>
In-Reply-To: <20190513114725.17823-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63aad368-eb16-4bf2-58bf-08d70acf8d50
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1182;
x-ms-traffictypediagnostic: MWHPR2201MB1182:
x-microsoft-antispam-prvs: <MWHPR2201MB118269E273C6BC3EBECF993EC1C90@MWHPR2201MB1182.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39840400004)(396003)(366004)(376002)(136003)(189003)(199004)(54906003)(4744005)(5660300002)(52536014)(186003)(99286004)(14454004)(3846002)(8936002)(2906002)(386003)(102836004)(26005)(4326008)(71200400001)(11346002)(66066001)(42882007)(71190400001)(6506007)(229853002)(66476007)(66446008)(66556008)(64756008)(66946007)(316002)(478600001)(446003)(74316002)(7736002)(476003)(6436002)(305945005)(68736007)(53936002)(33656002)(81156014)(81166006)(8676002)(7696005)(52116002)(76176011)(6246003)(6916009)(25786009)(486006)(44832011)(6116002)(9686003)(256004)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1182;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Jal0is0LDVUzo00jywJDKFEmW5aP/Mgfcr+SWIb1Nef5yVoHuA1Xg3oy7MfElqB1/r0EQZsBdFtl1uwcPzl+ScLN2pqSojuzCFIcGyWb+z6BFUQJoIF4twv6VI4JUa2rUq3MZpXx48tODMnpPH47Hn15q+7Jx9VscLAk7tlk09BxWpxfcgJJeE+BULgagSlWCLBbeFaIxTDTNJHX74wdQI5cgdJ2YxvkFPQpsnM+zjOrbEnXXz0sSN25i+oYZ62JvIqBOvXxK74GZRJdWiYfl00qHBgx6+bmpNBo0Nv5IdfWygdtCeUN2mBuyYk5IVmaIswyoC7PIfKO6jGQClhT8FtTI3/ZuXeassgJtMHgZFZIEF8E7SuFAtUo1D97ldWgC/l9ABFtaJ8505B2pNmMKlanj5EmnqyI0XfLJWUHOA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63aad368-eb16-4bf2-58bf-08d70acf8d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 15:58:04.3086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1182
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> i8253 clocksource needs a free running timer. This could only
> be used, if i8253 clockevent is set up as periodic.
>=20
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
