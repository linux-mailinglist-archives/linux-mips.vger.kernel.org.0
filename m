Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A32147FFB0
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2019 19:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404697AbfHBRcb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Aug 2019 13:32:31 -0400
Received: from mail-eopbgr760121.outbound.protection.outlook.com ([40.107.76.121]:1799
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405327AbfHBRca (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Aug 2019 13:32:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdOeKK/vwv1YXj2F4UmkcIjuTal4ibDSj/hUrhp7URH7u2YhNQfrT4l/b3jkvy95yC48bW8KiZs41M/qt43+r7MzuKDLjFAry2v+WOngL/g4LOo1sznJK/hnHATqCe6OVzQBBkMKT6yjnYsm7+GgafKO04w4N3Z4hsWP2wgmTEJAAC7O/hT7XEfSLRjfPrCuB75DEdBK5L+uHcBrwdZZhHKD2PBDlxPzfSh+Cu/HNA6MkN2LnoN8mFA/Xm0BCKA7pn3MAZ7fFrsle0rHOsaU9ioUgQSLseNDDnVC8vCbKUxbELgXlh4Euu2qIKTibT+78HuYl5VhzZ7+EwaIOqu+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ILc9msuj8DU2fRxreRHzyE9gasYLe/Aqy8La8gbcBQ=;
 b=FI3nOI2scXrzj+SYEQ4JrXxPr8jcmUnPNJF41xOA/3bI7YZ+M71gQh/cF8Dqel36qmB+oZdFob87HOZMKWU0bFee/M9jPJrC+BPEwm3SHsaKJKTsHg2iM2m80icbKJWDHPL/8GNp0oMCzh9omnP4ihNidkmyVtuFGHts0aoMMPrJc86NTKmYaPI8+21u4szarFiGwu7/1ojAf2RVeT+EaGj2xVDx8e2GB+wY0I5dR/m6p37iLSv9zK3Lkx+V84YY9gIbsIWxbOm31nJW/R3eVSpKHxNXLG7Ywi6+2qmT8sSPPq+yieIzbTVy9uaLLfts6eHhHyU0FH/0icQF6877UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ILc9msuj8DU2fRxreRHzyE9gasYLe/Aqy8La8gbcBQ=;
 b=CsrqDGhG97QsFsHqj9b1pf2TYikBGJTfffVtcMF923v0mxwc4cPQlt3+TcL3LWAymymhIAn1dqMx/jj1p8dLYdoCkiKg7wv0mVKDrciFNDZIFcliwMWXdbyc1IVw0uyc5KIa/u6rvogBV47MAUHU6YOwwdMhSqgXjMRtSv2SKfA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1551.namprd22.prod.outlook.com (10.174.170.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Fri, 2 Aug 2019 17:32:26 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 17:32:26 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Zhou Yanjie <zhouyanjie@zoho.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "malat@debian.org" <malat@debian.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "allison@lohutok.net" <allison@lohutok.net>,
        "syq@debian.org" <syq@debian.org>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/2 v3] MIPS: Ingenic: Fix bugs when calculate
 bogomips/lpj.
Thread-Topic: [PATCH 2/2 v3] MIPS: Ingenic: Fix bugs when calculate
 bogomips/lpj.
Thread-Index: AQHVSVhAQknKRTzKSky3qlsaUU9P+g==
Date:   Fri, 2 Aug 2019 17:32:26 +0000
Message-ID: <20190802173142.avzg4qn733ju4kqf@pburton-laptop>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564661791-47731-1-git-send-email-zhouyanjie@zoho.com>
 <1564661791-47731-3-git-send-email-zhouyanjie@zoho.com>
 <1564709169.1988.0@crapouillou.net>
In-Reply-To: <1564709169.1988.0@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0036.prod.exchangelabs.com (2603:10b6:a02:80::49)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [50.238.188.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31a39178-43a8-40de-ba0a-08d7176f62cd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1551;
x-ms-traffictypediagnostic: MWHPR2201MB1551:
x-microsoft-antispam-prvs: <MWHPR2201MB15513E10EB9F462D399C43CDC1D90@MWHPR2201MB1551.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(376002)(346002)(366004)(136003)(396003)(39840400004)(189003)(199004)(6916009)(446003)(11346002)(9686003)(14454004)(186003)(6512007)(54906003)(1076003)(6436002)(102836004)(6246003)(58126008)(5660300002)(6506007)(7416002)(316002)(44832011)(8936002)(386003)(81166006)(99286004)(33716001)(8676002)(81156014)(2906002)(4326008)(26005)(66476007)(66556008)(66946007)(53936002)(66446008)(68736007)(486006)(305945005)(478600001)(64756008)(229853002)(42882007)(66066001)(3846002)(14444005)(6116002)(256004)(71190400001)(7736002)(52116002)(476003)(71200400001)(76176011)(25786009)(6486002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1551;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 38n/UtVlBMutw5IJ/00kOO3s/pU3NIQB5WjMuKXmb/xNeXh8hLgJYOKDmoWqxQdd+gHHvI0yi4lPmqv3TthA96v1Ldpin6WiZ7TR6K85vTwsn6yu0xLM0cBzylnPTFyWeQdXfKKfYeh0v0BtEns3c0/Wp3lhx7dZ/IJ42XX3422DOwuYQQwbEn4zESuaLB6nDyGFNVT5NkMc76Bgu8/3FnkmDY3I1d7KUGZmgFD+fnIjI6FDOOmFgF1ZhKwWYJw1FUhFda+oWhSBjl1qxAsFc4ggEHftlEVUmLqn3mE0vnOOVLjAqDkky2HazKm7Lai1wTV2z76vgzqT8dndSgnGrjrqWRupd2K8EGH3x9UpqwSXY2FS1OJ5FJA4du3l/vi5RpIg3T2tE75PuMG98rYKnNyjosytwy8b7wDmfuJ7q9Q=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <405530610D283C41A16881AF221E5790@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a39178-43a8-40de-ba0a-08d7176f62cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 17:32:26.3977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1551
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On Thu, Aug 01, 2019 at 09:26:09PM -0400, Paul Cercueil wrote:
> > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.=
c
> > index eb527a1..2bdd3e1 100644
> > --- a/arch/mips/kernel/cpu-probe.c
> > +++ b/arch/mips/kernel/cpu-probe.c
> > @@ -1964,6 +1964,13 @@ static inline void cpu_probe_ingenic(struct
> > cpuinfo_mips *c, unsigned int cpu)
> >  		c->cputype =3D CPU_XBURST;
> >  		c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
> >  		__cpu_name[cpu] =3D "Ingenic XBurst";
> > +		/*
> > +		 * The XBurst core by default attempts to avoid branch target
> > +		 * buffer lookups by detecting & special casing loops. This
> > +		 * feature will cause BogoMIPS and lpj calculate in error.
> > +		 * Set cp0 config7 bit 4 to disable this feature.
> > +		 */
> > +		set_c0_config7(MIPS_CONF7_BTB_LOOP_EN);
>=20
> Shouldn't it be MIPS_CONF7_BTB_LOOP_DIS then?
> Since the feature is disabled when the bit is set.

The name comes from the fact that we're enabling loops to use the BTB,
in contrast to the default state where this bit is zero & the bad
optimization kicks in causing loops not to use the BTB.

Thanks,
    Paul
