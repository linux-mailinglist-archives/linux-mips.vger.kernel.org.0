Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1BF9C9C89
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 12:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbfJCKnl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Oct 2019 06:43:41 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:10963 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbfJCKnk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Oct 2019 06:43:40 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Kh5AeDeYqy3qrgTU4+YVPpMhCxxzB7hpqC16ge+KzRXkC0j0Bj0ul837NXkdfC9hUDJ+UtcRl8
 u2vAeewPQELKMvISXpy4NhV2u7Xs7hN1SoV+PTkr37nCXJXftE4BPNsB0L6c+Orb7h0QucDCU0
 JyWt1moq/7d0mX5owx65ZKAt5x9AdpaHEzgutpiQCcGZ0O2kgx4WcbVUhQXwIhGNBdn8YBONy3
 /+12fXqBd/METlGevr8NNE977B7mvwDVsfEBtH93LKfQ0zluSwMB0yFpNPRLp/zRdpPXd7gzdR
 CFk=
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; 
   d="scan'208";a="48625222"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Oct 2019 03:43:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 3 Oct 2019 03:43:17 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 3 Oct 2019 03:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmBcVLKEhij8qewyyT7i4CpKzD9t0NZqIkyY9+eOFAOrZhGpQdacVveONQFcG171NiLlVnKm1yn/5+pYyXUHcfHXlHiiRkSXPtUi4VErkQ0tJDomfxu+q1iGmtV7XVjn8lYAAhsSR+Vx+DyNLk/UUOd2HpDctIgdSB/v81zPbZ3HFb9sRI4vG1H9dnZpTNm+snKSkou5sfFjmJJ54qg+bDmBs7VFh1D7VmZ5OdO2jhASG71wbeIPkoiCpQXDP1VNQocH8+fjgDBrM99xT5W9yA0exuyS+lLiCrSu4v0H79S8o+kxr5aLd9IuDR9EbYKlv6iWFvRDpwtFikVhTka/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z6O/TIUCmreGOqJOF86HxnnUsT7MBXi3SZECPGHZWY=;
 b=ipEsxUSmODC7eAYRu8BHncOy46qmydHd2ekcvaia5/ff2ievfAKKuDn3+FTABuch0QB5CkeH9eontv16kfrLH7XCITNaUfJFE+Zb151+W1pr+/KfhSWcZsCVYS7xtrFr3566KftZNmVJlXpWLEMRoVyuN1oNfgyS9mr67+H3L4DZKNZ17RKb9lhugoXH07hBU9P6wamrOhL3CQWhZnmWJrro8HEjZfLkzUjQENbyCNmFHck9bsOE1pcCveRD9kdqqTIgnPLSVFdUYPCmf83QXEPugTUFy2sb6vct4kCYeN7jUH3+pFSUv3ty8sCXJwHIj9oAszaOzvmIcNAHXMYSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z6O/TIUCmreGOqJOF86HxnnUsT7MBXi3SZECPGHZWY=;
 b=vb8BKKiiVyYfgsS4n8v6vqtYiJ+6Oa1ExfDLHe3pDxZxpwct6FkuKFhgqilSaiPxqAhQZ8Fo4At0x52LPpW9tEVk77CvPh5yc29/NYI8LLCFeBNQGcTRPrcP4GFM2iQGXO286nGyl+0hgmpiL77yjs/j/fHY/wiCEON97aYpRu0=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.85) by
 DM6PR11MB3321.namprd11.prod.outlook.com (20.176.122.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 3 Oct 2019 10:43:14 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22%6]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 10:43:14 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <daniel.lezcano@linaro.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux@armlinux.org.uk>, <nsekhar@ti.com>,
        <bgolaszewski@baylibre.com>, <monstr@monstr.eu>,
        <john@phrozen.org>, <ralf@linux-mips.org>, <paul.burton@mips.com>,
        <jhogan@kernel.org>, <lftan@altera.com>, <tglx@linutronix.de>,
        <vgupta@synopsys.com>, <marc.zyngier@arm.com>,
        <patrice.chotard@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <eric@anholt.net>, <wahrenst@gmx.net>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <linus.walleij@linaro.org>, <shc_work@mail.ru>, <kgene@kernel.org>,
        <krzk@kernel.org>, <ysato@users.sourceforge.jp>,
        <liviu.dudau@arm.com>, <sudeep.holla@arm.com>,
        <lorenzo.pieralisi@arm.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <baohua@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <baruch@tkos.co.il>,
        <u.kleine-koenig@pengutronix.de>, <guoren@kernel.org>,
        <kaloz@openwrt.org>, <khalasa@piap.pl>, <ssantosh@kernel.org>,
        <vz@mleia.com>, <slemieux.tyco@gmail.com>, <khilman@baylibre.com>,
        <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <afaerber@suse.de>,
        <manivannan.sadhasivam@linaro.org>, <narmstrong@baylibre.com>,
        <agross@kernel.org>, <palmer@sifive.com>, <aou@eecs.berkeley.edu>,
        <heiko@sntech.de>, <orsonzhai@gmail.com>, <baolin.wang@linaro.org>,
        <zhang.lyra@gmail.com>, <maxime.ripard@bootlin.com>,
        <wens@csie.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux@prisktech.co.nz>,
        <john.stultz@linaro.org>, <sboyd@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mips@vger.kernel.org>, <nios2-dev@lists.rocketboards.org>,
        <linux-snps-arc@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <uclinux-h8-devel@lists.sourceforge.jp>,
        <linux-amlogic@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
        <linux-oxnas@groups.io>, <linux-arm-msm@vger.kernel.org>,
        <linux-unisoc@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/7] add support for clocksource/clockevent DT selection
Thread-Topic: [PATCH 0/7] add support for clocksource/clockevent DT selection
Thread-Index: AQHVc8VbrLXkUp4vH02J/Sk0g3X+4Kc9pRwAgAm/1ICAAWIegA==
Date:   Thu, 3 Oct 2019 10:43:14 +0000
Message-ID: <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
 <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
In-Reply-To: <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0173.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::21) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:59::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191003134249853
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a69bb484-2581-4090-3e6f-08d747ee7e34
x-ms-traffictypediagnostic: DM6PR11MB3321:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB33210DD9F544189800B49B2D879F0@DM6PR11MB3321.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(366004)(39860400002)(376002)(136003)(51914003)(189003)(199004)(6436002)(6116002)(76176011)(25786009)(2501003)(5660300002)(316002)(53546011)(3846002)(386003)(6506007)(110136005)(8936002)(476003)(486006)(71200400001)(81166006)(966005)(81156014)(102836004)(2171002)(71190400001)(99286004)(1191002)(52116002)(2616005)(6246003)(7336002)(14444005)(186003)(2906002)(7366002)(256004)(6306002)(6512007)(561944003)(229853002)(2201001)(26005)(14454004)(7416002)(31696002)(86362001)(6486002)(4326008)(54906003)(7736002)(64756008)(66446008)(66476007)(66556008)(66946007)(305945005)(8676002)(478600001)(446003)(36756003)(66066001)(11346002)(7406005)(31686004)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB3321;H:DM6PR11MB3225.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5PBf28dhTyEM+9xzweuKzLQ5Hf71K1eZ/d6kOgcgTpKsRjJCItVUlQZAeGuknztE3Q/o6x8QM65SOoyfcCo8Z2+Beih+T5rCxCW2HvbE7GOQac8vkdo2sRP5SnHjNFCE3RNBLdIOsAl+hl/uaQVOSpCxsA8d0TSoWnoeqJQ8la5s8Xs5NdRtMztgqsVs+xl8l+R7Nd9/5n39dKx1FOMScLpbkQaBdomNYHIPxsvmO8cUEr/MRSYT8P5CyK6kX1TJOpdw1aacriChcEaFgodmtYjZU9PsaD52Pj3neWGWBfuPne4hASiO+Aw5OeWtoJ1KaaB3DrO3hPscVSs+mV7DWPkS8rrSmdRVlE2O0yRDGTejpczZOi/L6URBqmvHMEWDZuue5C7tmYXewfnUJX+WFRtcafraXBkrRM5wmqXQL/8XAlMCaYuv4/p8Bdpa0HMahD3ms2znwq1mwEIlvVOCVw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <51816439DDB2EA498830860703402E31@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a69bb484-2581-4090-3e6f-08d747ee7e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 10:43:14.7902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0CMnEwf05eZLlk9enoiVzUG4uHDU/anYqc9xKhCaWxWNmd36ZMXcfz6M1182SPjNMZEmzvgm531qYuHGQL4T1UyEkDN54kgtrooQKtkZGhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3321
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQoNCk9uIDAyLjEwLjIwMTkgMTY6MzUsIENsYXVkaXUgQmV6bmVhIHdyb3RlOg0KPiBIaSBEYW5p
ZWwsDQo+IA0KPiBUYWtpbmcgaW50byBhY2NvdW50IHRoYXQgUm9iIGRvZXNuJ3QgYWdyZWUgd2l0
aCB0aGUgc29sdXRpb24gcHJvcG9zZWQgaW4NCj4gdGhpcyBzZXJpZXMgZG8geW91IHRoaW5rIHRo
ZXJlIGlzIGEgY2hhbmNlIHRvIG1lcmdlIHRoaXMgZHJpdmVyIGFzIGlzPw0KDQpTb3JyeSwgSSB3
YXMgdGFsa2luZyBoZXJlIGFib3V0IHRoZSBkcml2ZXIgYXQgWzFdLg0KDQpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8xNTUyNTgwNzcyLTg0OTktMS1naXQtc2VuZC1lbWFpbC1jbGF1
ZGl1LmJlem5lYUBtaWNyb2NoaXAuY29tLw0KDQo+IA0KPiBJZiB5b3UgaGF2ZSBvdGhlciBzdWdn
ZXN0aW9uIEkgYW0gb3BlbiB0byB0cnkgaXQuDQo+IA0KPiBUaGFuayB5b3UsDQo+IENsYXVkaXUg
QmV6bmVhDQo+IA0KPiBPbiAyNi4wOS4yMDE5IDExOjQyLCBDbGF1ZGl1IEJlem5lYSB3cm90ZToN
Cj4+DQo+Pg0KPj4gT24gMjUuMDkuMjAxOSAyMDoxOSwgRGFuaWVsIExlemNhbm8gd3JvdGU6DQo+
Pj4gRXh0ZXJuYWwgRS1NYWlsDQo+Pj4NCj4+Pg0KPj4+IEhpIENsYXVkaXUsDQo+Pj4NCj4+PiBP
biAxMC8wOS8yMDE5IDE1OjQ3LCBDbGF1ZGl1IEJlem5lYSB3cm90ZToNCj4+Pj4gSGksDQo+Pj4+
DQo+Pj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBwZXJtaXQgdGhlIHNlbGVjdGlvbiBv
ZiBjbG9ja3NvdXJjZS9jbG9ja2V2ZW50DQo+Pj4+IHZpYSBEVC4NCj4+Pg0KPj4+IFRoYW5rcyBm
b3IgdGhlIHByb3Bvc2FsIGFuZCB0YWtpbmcgY2FyZSBvZiBtYWtpbmcgc29tZSBwcm9ncmVzcyBv
biB0aGlzLg0KPj4+DQo+Pj4gSSBqdXN0IHdhbnRlZCB0byBsZXQgeW91IGtub3cgSSd2ZSBiZWVu
IHRyYXZlbGluZyBidXQgdGhlIHNlcmllcyBpcyBpbg0KPj4+IG15IHBpcGUgYW5kIEkgZGlkIG5v
dCBmb3JnZXQgaXQuIEknbGwgY29tbWVudCBpdCBuZXh0IHdlZWsuDQo+Pg0KPj4gSGkgRGFuaWVs
LA0KPj4NCj4+IE5vIHByb2JsZW0uIFRoYW5rIHlvdSBmb3IgbGV0dGluZyBtZSBrbm93Lg0KPj4N
Cj4+IENsYXVkaXUNCj4+DQo+Pj4NCj4+PiAgLS0gRGFuaWVsDQo+Pj4NCj4+Pg0K
