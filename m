Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E5AABCD9
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2019 17:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405825AbfIFPpc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Sep 2019 11:45:32 -0400
Received: from mail-eopbgr690092.outbound.protection.outlook.com ([40.107.69.92]:18566
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405783AbfIFPpc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Sep 2019 11:45:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObAKS+VBBuXqxyrebgWmklxBovkYO6K1WsP6vyKvPA6ET7k2mzAurJvWgH53XYBdXQBbOzn89oFx53w2htyJuVGRQLE59mZ+4fejn8jWwU782Px32TI0gtiAwciTj9SR2G1Eb0c1oYmz1c6/T6BoHKa6yVW0TBIB08Niqk58qMZCgq1RI2sl6Xdb684eL3Er0FG46D4dNDep8eJaA9gieATe3tilEmnPc9ldI94KX7/Km3EiJsHSB5WTF1kJZtbiVlGVUO8KLFVgfULIgM+lEgCScAV2JIUjYvyp/rPbmnqWF7c4boDnXTWwogo4ENNOVJnDqsOhldh3O0LFG5Lh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnWFLFGwYS1ybp63DHUU9TXj173IuZMSqLX49TdrfN8=;
 b=TYiRhQgcO5Q8lRah9MBWQH29+ZaFa6etDhOeIKdHMNi/PlthPWMtvWUy9Ujjg5NvOtOB6G+KvXWwm6GkkPvKt3b4hQKgj65oUtLviWdgeUq2SGxQe1CBIWj9v1NIPl7cOnR7GXpiFiBP19TKgMGXaPXWL1+N0IoqGygdMkwQmKz9KI0BX4bm9Qr9OfDt+YnxuB7EjkrYML4Xl3CvTPWNapbtj+4SSdYQJqFVqOhFzNVZiINXNk0BteKlLXDcLZF/zU/yTLgBMw7eD0luEtCAG1G0lknxem0i+05YguqKai+iAtWB5ZaFMB7+HJDqo6GJPFp9oixWxUn/THJqjzrbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnWFLFGwYS1ybp63DHUU9TXj173IuZMSqLX49TdrfN8=;
 b=JarxbcyP266ksmEvQKJvbZmRRSCRgYpboAMpRilF9h/0peeKIco+TqnOrNnPnTkGrhRq/T3xF7z53Lh+uazdsBAv1h1WBkTfWcNTtnRLaifzyXYU4b0ChVC6DeO1kwh1jxSiKkLeNXlgTGs5EDnz0kM25fTOSu4sz4L+spSrQ0k=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1566.namprd22.prod.outlook.com (10.172.61.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Fri, 6 Sep 2019 15:45:28 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2241.018; Fri, 6 Sep 2019
 15:45:28 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Hauke Mehrtens <hauke@hauke-m.de>
CC:     "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "john@phrozen.org" <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ralink: deactivate PCI support for SOC_MT7621
Thread-Topic: [PATCH] MIPS: ralink: deactivate PCI support for SOC_MT7621
Thread-Index: AQHVZMobwA5dg8upr0ivkbGZ8NrEIg==
Date:   Fri, 6 Sep 2019 15:45:28 +0000
Message-ID: <MWHPR2201MB1277AE843711D88BD865C565C1BA0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190904213306.26493-1-hauke@hauke-m.de>
In-Reply-To: <20190904213306.26493-1-hauke@hauke-m.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:180::20) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0195e182-783d-451e-4274-08d732e13dca
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1566;
x-ms-traffictypediagnostic: MWHPR2201MB1566:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1566FE49E624A9C0A0B0743CC1BA0@MWHPR2201MB1566.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(376002)(396003)(366004)(346002)(136003)(189003)(199004)(2906002)(5660300002)(3846002)(6116002)(4744005)(446003)(42882007)(11346002)(44832011)(486006)(476003)(99286004)(71190400001)(71200400001)(102836004)(54906003)(316002)(52116002)(26005)(186003)(4326008)(6506007)(386003)(7696005)(76176011)(966005)(478600001)(256004)(81166006)(33656002)(305945005)(7736002)(74316002)(14454004)(8936002)(6306002)(55016002)(6246003)(25786009)(8676002)(81156014)(9686003)(53936002)(6916009)(66446008)(64756008)(66556008)(66476007)(66946007)(66066001)(52536014)(229853002)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1566;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cGd2Ju8/6Q65kq9k7auwnLsP66kU9QxnvV8mSqCOcAs/kyFj+5OpCR21gOoPYBSfC8cWCZ3LoXwt9coMx7RwvnaVZ0vtnVfCGpM/50hyiwKXkV38JYQEJ1R/rVODO9xfMbPJPaH+7g7bR8+eet2UmG/DYoRPaOaHgblAHTjt3CvIab7Y98eFqdIVbifkBGom0dWil4zs9aiCTSRhOtp2e5IQCXN44nxiGY3SxuBvl1LbgTFu8RL7qfZKNSYWiFEX4/0Et2NZbN1zFu7nR8MTRiAKNmvSZSdbAY+FgAl8FZCqz/LELvu71MXoUD9mTz2hsq/PW+zdGHXWAIHDBmbdT9bEKUAWD4avBStOSMwBv7D0npI/AKpYit6v6Lvv0QzMWSyPZ5SudBrd2tjYesLHCQ4W7YED4zoT0UbBTclIt8M=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0195e182-783d-451e-4274-08d732e13dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 15:45:28.4789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rafZxa7oEv4vNC4OKe7EQds4wCUKD6gHqa1sZ2xIbv0kA3rlZ5jErunUhy5jzVQKG0WY/8SUm2+Qf0PDXBIt/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1566
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Hauke Mehrtens wrote:
> The Linux does not support PCI on the SOC_MT7621, if it is selected the
> Linux build runs into a compile error. Remove HAVE_PCI from the
> SOC_MT7621 SoC.

Applied to mips-next.

> commit c4d48cf5e2f0
> https://git.kernel.org/mips/c/c4d48cf5e2f0
>=20
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
