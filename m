Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46AE9D722B
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2019 11:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfJOJXt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Oct 2019 05:23:49 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:1033 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfJOJXt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Oct 2019 05:23:49 -0400
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
IronPort-SDR: rXFTltOiIYusDEFIfDhz9HhCPGCwTHmv+39ufI7F1cBRrINWI07PCbHs0xhJIhh7Z+FSlcVT3C
 PdizDsz81Fu/nMcesDjrZ39ciy4sGEUtUFhSnpHRWo7Tly7j4ARdhusyFllp4nplDPlbd4VfIj
 plz96QXQz404CaXTGGXq49xuq7bW+3CQIlzjenyYqpDHyH8Cp7clLKbc7nIvSqiCwqFpBAkuRG
 4vatespU8ZUI/8kibj0jPN21BbGLPRGAcR/om2vowt5VVqRT3h0UPZL/Q3Kk5+b1XbAFuyc1T9
 O9E=
X-IronPort-AV: E=Sophos;i="5.67,298,1566889200"; 
   d="scan'208";a="52997501"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2019 02:23:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Oct 2019 02:23:41 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 15 Oct 2019 02:23:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNDEQuuyTzADbaoc7ugixWmCOpREDrL+CVhMMkGxo8zMWXLAUO1uiuhf6aymq0r5YMKJUayYbiWqP9fQcQSDaiPeeaF4t3A4447YVkqEHEv0Z23+WkGs1w5kO8Bf+iehnphuElGs5z0lXpzix5hWJgycEljOYPVIuCn3UamxHgKUfJ157DwOsAvAD12O4YfXBAyOca95aJK0toymZsSFhSEmoxk17s84uLZDuMweGbDpJZpggbQ6lYyinxunm0+I+5cVQb5iU/JKlfMmvusfy15iocQDeqQTxB+cjCERSOWDFOdHVK4JZ3VAa8xPfkdXRiiUMTm2dUCO7XsR/142bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aGhdWqY3Fnc2zZWuG4aXUs+xH7yPkHgIIzfz85IGe8=;
 b=HMrjqrxjwNJEImoMukkIQZoOMHgVADmJ+innXOCao6+dQVTkbJIwS07QAaYERsIQ8bYapRIgGzLsAIEzOC7AlbAiHOy8QZwJ9/VkAVTncGnQ0CWlpPynw/I8N51QnfXmA61aQBbNnNHcN1tGuCO9FtQoNsRtyP1IdGI7AFs00BXhkFE52lJf23Zpcd88z6r48rx5XCKIpB61hjSfftaA8vOI5NM/FXohL9iLQy3LOXzNJ6QY3/VdpAnk4GGsCjMRuYmHkPN9Lsqc16meRafT69d9nJW4sPUvHNR5c7Oqv09q2sBffg/t9Wbi7UYWAM0lSSHzgq0lLL4xDdBdMdd+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aGhdWqY3Fnc2zZWuG4aXUs+xH7yPkHgIIzfz85IGe8=;
 b=TxqNkYll6aV6QMceQhJDf7BnsT5lNY2Vzckpb+gIOZYHgkkzQa2no8SB4b8sMzVIs2zKWahOXIBfnmWPqiXl+NpCgRGfzsuTbjaqkpS7KA1wmQ0eRflUKhKuQIzP+JrLibAPfzmTl8yR4lT43tBM2pa9cak2ajkLaXf20YhjP9I=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.85) by
 DM6PR11MB3146.namprd11.prod.outlook.com (20.177.219.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 09:23:35 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22%6]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 09:23:35 +0000
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
Thread-Index: AQHVc8VbrLXkUp4vH02J/Sk0g3X+4A==
Date:   Tue, 15 Oct 2019 09:23:35 +0000
Message-ID: <7071b6fa-f7ed-c879-4a43-44100dbe6121@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
 <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
 <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
 <14df6e5d-19ef-4ebc-fd11-9953bc3fc44e@linaro.org>
In-Reply-To: <14df6e5d-19ef-4ebc-fd11-9953bc3fc44e@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0177.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::25) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:59::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191015122310531
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 903bf272-15ec-4b39-7326-08d751515a8c
x-ms-traffictypediagnostic: DM6PR11MB3146:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB31465E8CCD9A2DFCEFF38A7587930@DM6PR11MB3146.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39860400002)(346002)(136003)(366004)(376002)(189003)(199004)(1191002)(386003)(6506007)(4326008)(71200400001)(53546011)(14454004)(102836004)(36756003)(31686004)(25786009)(478600001)(110136005)(14444005)(52116002)(66946007)(66446008)(256004)(76176011)(305945005)(64756008)(66476007)(66556008)(966005)(229853002)(54906003)(99286004)(7736002)(66066001)(86362001)(2201001)(6116002)(2906002)(26005)(11346002)(7416002)(6306002)(6512007)(186003)(2616005)(476003)(486006)(6246003)(71190400001)(7366002)(7406005)(7336002)(6486002)(8936002)(5660300002)(81166006)(81156014)(446003)(8676002)(316002)(31696002)(2171002)(3846002)(2501003)(6436002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB3146;H:DM6PR11MB3225.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E6WiqbrMgLABzTuw0J9j3v67ijI/hQBH1RWNsWatD7hOHuh5SIIMCMHoLvyKJEoW6XDxh5AoX2Ef+XdBBpvEyn4/qbCbwjH3OsgkLMvqBD06S4p9ORDlq9zasJegmIQE//C0ZihL2ZOoIcbGEIiui1+a8RY8F4t6hm/Wcq7W+vH8JS8x5GlWYbGrCoN4XuY1SaEe3LkB1a6uJGKt4CiEfJwo0XSe50uneb2DqFcHDNX92BltSs5knX4KAva0mEfrR6bfp3IWTKvunvvUS05GtPDB2BzbZ8weO1/vEor8VAHIPrAmR+UJ8BFyVY/sfwUWYq+ZOnjOY3s0qW/dr5F1X+RxRxO6ll6JLrvoxwEOy74Dt4tW5cI9sjhrIGSwbdik/clFSsmRhKmrOGYHD8dsxVBJz6ExosWFZ9HZCrNlNaGK4DDgxp33ZR4NtEOc5FsV
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFEA965B7AA9B54388AC67448362747B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 903bf272-15ec-4b39-7326-08d751515a8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 09:23:35.2487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z8aXzzMcSPD4+Z12Z92evGbhOPtVVEiPr1QR59wKyZPbxgxJRH5GLNcoeXiYW+CPcZiWidPIE+x/H9SvgQ0uOeYLCPJa5w7TPl7eizAszNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3146
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgRGFuaWVsLA0KDQpPbiAxMy4xMC4yMDE5IDIxOjE2LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToN
Cj4gSGkgQ2xhdWRpdSwNCj4gDQo+IHNvcnJ5IGZvciB0aGUgZGVsYXksIEkgd2FzIE9vTyBhZ2Fp
bi4NCg0KTm8gcHJvYmxlbSwgdGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lg0KDQo+IA0KPiBPbiAw
My8xMC8yMDE5IDEyOjQzLCBDbGF1ZGl1LkJlem5lYUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4N
Cj4+DQo+PiBPbiAwMi4xMC4yMDE5IDE2OjM1LCBDbGF1ZGl1IEJlem5lYSB3cm90ZToNCj4+PiBI
aSBEYW5pZWwsDQo+Pj4NCj4+PiBUYWtpbmcgaW50byBhY2NvdW50IHRoYXQgUm9iIGRvZXNuJ3Qg
YWdyZWUgd2l0aCB0aGUgc29sdXRpb24gcHJvcG9zZWQgaW4NCj4+PiB0aGlzIHNlcmllcyBkbyB5
b3UgdGhpbmsgdGhlcmUgaXMgYSBjaGFuY2UgdG8gbWVyZ2UgdGhpcyBkcml2ZXIgYXMgaXM/DQo+
Pg0KPj4gU29ycnksIEkgd2FzIHRhbGtpbmcgaGVyZSBhYm91dCB0aGUgZHJpdmVyIGF0IFsxXS4N
Cj4+DQo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNTUyNTgwNzcyLTg0OTkt
MS1naXQtc2VuZC1lbWFpbC1jbGF1ZGl1LmJlem5lYUBtaWNyb2NoaXAuY29tLw0KPiANCj4gRGFt
biEgNyBtb250aHMgb2xkLiBJJ20gdHJ1bHkgc29ycnkgd2UgZG8gbm90IGhhdmUgcHJvZ3Jlc3Mg
b24gdGhpcy4gTGV0DQo+IGZpeCB0aGlzIG9uY2UgYW5kIGZvciBhbGwuDQo+IA0KPiBJbiB0aGUg
ZHJpdmVyOg0KPiANCj4gcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImNsb2NrLWZy
ZXF1ZW5jeSIsICZmcmVxKTsNCj4gDQo+IEl0IGlzIHVuY2xlYXIgaG93IGlzIHVzZWQgdGhpcyBw
cm9wZXJ0eS4gSXQgc2hvdWxkIGJlIHRoZSBmcmVxdWVuY3kNCj4gZHJpdmluZyB0aGUgdGltZXIs
IGJ1dCBjYW4gd2UgZ2V0IGZyb20gYSBjbGtfZ2V0X3JhdGUoKSBhbmQgYSBmaXhlZCBkaXZpZGVy
Pw0KPiANCg0KVGhlIHRpbWVyIGNvdWxkIGJlIGRyaXZlbiBieSAyIGNsb2NrIHNvdXJjZXMsIG9u
ZSBpcyBjYWxsZWQgcGVyaXBoZXJhbA0KY2xvY2sgYW5kIGlzIHRoZSBjbG9jayB0aGF0IGlzIGFs
c28gZHJpdmluZyB0aGUgSVAgaXRzZWxmLCBhbmQgb25lIGlzDQpjYWxsZWQgZ2VuZXJpYyBjbG9j
ayAodGhpcyBjb3VsZCBkcml2ZSBvbmx5IHRoZSB0aW1lciBpdHNlbGYpIGFuZCBzaG91bGQgYmUN
CmF0IGxlYXN0IDMgdGltZXMgbG93ZXIgdGhhbiB0aGUgcGVyaXBoZXJhbCBjbG9jay4NCg0KV2Ug
Y291bGQgY2hvb3NlIHRoZSBjbG9jayBkcml2aW5nIHRoZSB0aW1lciBieSBzZXR0aW5nIHRoZSBQ
SVQ2NEJfTVIuU0dDTEsNCmJpdCAoMCAtIG1lYW5zIHRoZSB0aW1lciBpdHNlbGYgaXMgZHJpdmVu
IGJ5IHBlcmlwaGVyYWwgY2xvY2ssIDEgLSBtZWFucw0KdGhlIHRpbWVyIGlzIGRyaXZlbiBieSB0
aGUgZ2VuZXJpYyBjbG9jaykuDQoNClRoZSB0aW1lciBjbG9jayBzb3VyY2UgY291bGQgYmUgZGl2
aWRlZCBieSBNUi5QUkVTICsgMS4NCg0KU28sIEkgdXNlZCB0aGUgY2xvY2stZnJlcXVlbmN5IERU
IGJpbmRpbmcgdG8gbGV0IHVzZXIgY2hvb3NlIHRoZSB0aW1lcidzDQpmcmVxdWVuY3kuIEJhc2Vk
IG9uIHRoZSB2YWx1ZSBwcm92aWRlZCB2aWEgdGhpcyBEVCBiaW5kaW5nIHRoZSBiZXN0IGNsb2Nr
DQpzb3VyY2UgYW5kIHByZXNjYWxlciBpcyBjaG9zZW4gdmlhIG1jaHBfcGl0NjRiX3ByZXNfcHJl
cGFyZSgpIGZ1bmN0aW9uLg0KDQpBcyB0aGUgZGF0YXNoZWV0IGZvciB0aGUgcHJvZHVjdCB0aGF0
IGlzIHVzaW5nIHRoaXMgSVAgaXMgb3BlbiBub3csIEknbQ0KaW5zZXJ0aW5nIGhlcmUgYSBsaW5r
IHRvIGl0IFsxXS4NCg0KVGhhbmsgeW91LA0KQ2xhdWRpdSBCZXpuZWENCg0KWzFdDQpodHRwOi8v
d3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2VuL0RldmljZURvYy9TQU05WDYwLURhdGEtU2hl
ZXQtRFM2MDAwMTU3OUEucGRmDQoNCj4gDQo=
