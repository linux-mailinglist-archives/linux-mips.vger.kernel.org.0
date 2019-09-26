Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2CB0BEDA2
	for <lists+linux-mips@lfdr.de>; Thu, 26 Sep 2019 10:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbfIZIn1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Sep 2019 04:43:27 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:14473 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727523AbfIZIn1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 26 Sep 2019 04:43:27 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: bGPvAKkYtCCIgj6XsufIyAqUrQrFHrlqJehWu8yrdxg4XiZIE8HY3m74zYA4pBIl2dM7Pq+ZiJ
 LMvmeWr6vZnbyNa1dvP5oH0bFOGDI+E7wEt2XDFgNrRn/F2jWKLV/Sui2cTi/x8ankFs/PIURZ
 TCg8MTFdqbtLfps3qWHL/iIhNj31YdPJxbUvZNLKnOEScDu8lsPFT/Lo48djBzoPV70jWJWvau
 vMusOB4QRQ1oBRtYgjzGwcUplzmz3fjJ4kwuop2bnbMgjUTrRgFlSlR/yGLz4fFsqwnPjLBbN+
 /Jg=
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; 
   d="scan'208";a="50637679"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2019 01:43:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 26 Sep 2019 01:43:00 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 26 Sep 2019 01:43:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAKd7nZdlrszjrScV/mDSpWwlBQpz4OW0Dq5CkoWjMuANbBM/5HX/mvCJ1BNkwGaou60fK1luDG1SuErBCcdivcJl6U97E+tf1icsRtvuQ/c+Vr2D92oKwwatg0KqviXN2zYMA798CDsrMljh0bRj+9j1SbWoeVILlyHFAkEqx84mpvhrLkUSFLHJt4KtSrf/z7OA4pgb9SOD2xLoG0W4nM2nMGaKlqL1hWyj4ap6F9Q7eD/Dwx55GTPy9NYABjKlRNGK1h+vhv9d6jaUomv8NBO5QBvowkgirRyJRDu6PpaLkQDcirfByS9IQ6JXG+x/2GcEY46GPeFLsYudjLlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EWbUDqnvgUzzXQW00IRG+60rKbfAvKMDdZxX46efN0=;
 b=PMuHzwlKZ/fYZX5ADVZQMHPliV3OCxDJetV6TPNVzFVpB9wpLqxsMO4dGQNYuW20PuyJ1gi3lxhJY2T7t0XOtb60I9UIvRErFWu0AakkepzRnilU+wMxIEn7YSnUWm315jeiJ1n9jl3CaJ9iIFD9QOFvG/zkfG7//OozLJdk5UxfBrXWpS68TI21N8kiWIIiE7jSToEPXJyxoMNzYcFomFLL+dxvwKQ4CAd/GIYbuKUGFHRHwLgZbGNKfW9ygkwPtRQFbsZIhzc8QabpS3eFPJQig+U2BqU+r4p3K44MosG5VXOrEtN0H1s7i5FFbpsZO5ToS4D6o1jN0neJDEjLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EWbUDqnvgUzzXQW00IRG+60rKbfAvKMDdZxX46efN0=;
 b=sRxHJIvVGtZ8/GEHxWp33aMPe7Q4GBN7VmF5wkFAFLTlyjSyrWQenBoVymB9ziCE1mLc20JUtKFtda5cfZmJD77buGVJQ/kmAe0jvenOIQF+StDHIvxBJI3+CHQiN/0f+r5T2RN8LBa8K6t8Z5LFY6BQYYDheLYNVw6KDBXpydM=
Received: from MWHPR11MB1549.namprd11.prod.outlook.com (10.172.54.17) by
 MWHPR11MB1901.namprd11.prod.outlook.com (10.175.54.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 08:42:58 +0000
Received: from MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::1c73:1329:a07:ab9a]) by MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::1c73:1329:a07:ab9a%12]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 08:42:57 +0000
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
Thread-Index: AQHVc8VbrLXkUp4vH02J/Sk0g3X+4Kc9pRwA
Date:   Thu, 26 Sep 2019 08:42:57 +0000
Message-ID: <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
In-Reply-To: <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MR2P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::29) To MWHPR11MB1549.namprd11.prod.outlook.com
 (2603:10b6:301:c::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190926114228283
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc557067-1077-42be-6717-08d7425d8720
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR11MB1901;
x-ms-traffictypediagnostic: MWHPR11MB1901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB19011D574DC5569C649FB82D87860@MWHPR11MB1901.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(136003)(39860400002)(366004)(51914003)(199004)(189003)(446003)(4744005)(71200400001)(25786009)(386003)(6506007)(52116002)(229853002)(71190400001)(53546011)(6486002)(7416002)(76176011)(36756003)(7406005)(7366002)(31686004)(7336002)(14454004)(6512007)(66946007)(1191002)(561944003)(64756008)(66446008)(66476007)(7736002)(305945005)(99286004)(2501003)(5660300002)(102836004)(256004)(14444005)(66556008)(476003)(26005)(6116002)(6246003)(11346002)(486006)(86362001)(31696002)(316002)(8676002)(81166006)(81156014)(6436002)(478600001)(186003)(2171002)(3846002)(8936002)(110136005)(54906003)(2201001)(2616005)(4326008)(2906002)(66066001)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB1901;H:MWHPR11MB1549.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JsNRlFiKu2xImweAE+BluMpKIUoInHFuE2sg+dLKuGs4T9kFDOqgcHKJUCYS2gybgMXXZI5osydBUn9KNyoHWWJ6/NEaYP7KAKFfRJ0/CBzJRNVV9Mpz72YJ/dwnH04AjmMgpY41/nVVGtmUYJYTJXrEzGLfmayrGh8nNn5Sbf4qIM3pSA5H8Sl3NizOFZQjufDCOp/GxaNSWWnBaSVrEfjMjVKTtgnofFe0H1aEiy8Tt0GakCl/TvuOscqDULtqdRbtiBBDaTwX3stbA4aowKc9J1UXVNNUbKf75xSs3TjOyQ7u+YASL6mozZNWDOz84BYusPgi0naRrvDr9rr+RxZsw27ZcfUbWPxhjmHmc/eWGyOuc1UAcucjh0WBPML8WyL/9v1fZOEV2kZBxSHkZAgdTmCtqwt/9/u7k/BT0i0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCA8ECD1111F6948AB05E557D0B1C52E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc557067-1077-42be-6717-08d7425d8720
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 08:42:57.4048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eE5XSWl4V1fxZGL0K/Lmn+PqH/2rvLsnNBp8C6u5rbSFictpiZGwaDBVFvOtdFPhk1KlWc6lCOOc/r1X6WP3h/tNVqI8F7Vm3oPSfeDBGRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1901
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQoNCk9uIDI1LjA5LjIwMTkgMjA6MTksIERhbmllbCBMZXpjYW5vIHdyb3RlOg0KPiBFeHRlcm5h
bCBFLU1haWwNCj4gDQo+IA0KPiBIaSBDbGF1ZGl1LA0KPiANCj4gT24gMTAvMDkvMjAxOSAxNTo0
NywgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBUaGlzIHNlcmllcyBhZGRz
IHN1cHBvcnQgdG8gcGVybWl0IHRoZSBzZWxlY3Rpb24gb2YgY2xvY2tzb3VyY2UvY2xvY2tldmVu
dA0KPj4gdmlhIERULg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcHJvcG9zYWwgYW5kIHRha2luZyBj
YXJlIG9mIG1ha2luZyBzb21lIHByb2dyZXNzIG9uIHRoaXMuDQo+IA0KPiBJIGp1c3Qgd2FudGVk
IHRvIGxldCB5b3Uga25vdyBJJ3ZlIGJlZW4gdHJhdmVsaW5nIGJ1dCB0aGUgc2VyaWVzIGlzIGlu
DQo+IG15IHBpcGUgYW5kIEkgZGlkIG5vdCBmb3JnZXQgaXQuIEknbGwgY29tbWVudCBpdCBuZXh0
IHdlZWsuDQoNCkhpIERhbmllbCwNCg0KTm8gcHJvYmxlbS4gVGhhbmsgeW91IGZvciBsZXR0aW5n
IG1lIGtub3cuDQoNCkNsYXVkaXUNCg0KPiANCj4gIC0tIERhbmllbA0KPiANCj4gDQo=
