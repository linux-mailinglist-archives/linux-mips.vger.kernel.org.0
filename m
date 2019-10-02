Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A153BC89D3
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 15:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfJBNfz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 09:35:55 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:2955 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfJBNfy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 09:35:54 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 4wJW8Z6pIw5pIUF5ER/InVYiXNlL/seNb69CH0Th+zlLPa0ShU8pnnPDakymNpoBG9viha+SFc
 cG5iDUGBMmGcPcm1bgipavHUex2T/z/vFq406jYcJWF0acTV7J2Y0bjvcHRSGhQTMh+EQD0rUV
 zh140DlLht4jdmYHm/hOX2Vi3jVcWleoDlq7R+9vXBvfDQs/x1lMOIWIaC/hskF2WPSRNFp4U5
 eGA5/2RFBuY8TKKrVE+dHpdkZkcA4Vj/lZHKj0rpPs/7lAR09+ZfHo9vWnrXMs2eu+SWG6PRyp
 QM8=
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; 
   d="scan'208";a="50129074"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Oct 2019 06:35:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Oct 2019 06:35:51 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Oct 2019 06:35:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5iFVnEgr0wI+S84W5RERWGPGWDRI0Ah/ZzcjHWfhsJked8FWEbgPULZTQOqcWeGp027VpuiNK7/mKslxJL0dvnifZIK0q0Z/KjU29BlICGACRb9v091Yy1hGp/aGkXByfOEKcUKuGivnMo1m4zYgbFfUnAnDH83Q/ZFBEcRlMDeDHsRgbq0kdvdm5cafhZuxicL2B1o8RZR604BIa1sHQzO71XwUf5EnGTs4GUlU3/uqWr8I4ylCsRJTYL8z8EzGrWnzibl4q++6cSsEcgBxVnpIaE+s+gj0cNKnD5nAE9pT/7VoEffC3HI4gd00WSAA49zyvLy4hl3kDhGie+Xiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FMHeUvg4V35rtNI89bSKaamLcyISpEcbJjLY1o2vEg=;
 b=EkmV5w/xNuPDIeFZdlGtaSDORY4O28KnMkGABYDsx7oPTkEpG0IMTDzy8odKxR/iOzZd23AS/gQaGrRpUX9mCxDvA2utU/3hqrx2//Vt7/k/cqpP7sEz25//IAvaK6OdyIvNs9hwwxJIzAfB7O69xOzTVAwpCsKUuHHe1KklTIN5qWvFddWgROuYNqMsK571zDlwTLKh0o3duJskAsQJ8y/NOqBZu5Pq+/rM7voCHS5ZhUVmLJQPDycRZ3F87fSFgrIN0C+aDdoEA+DJ0dlXSFRartRXHyCBJSY/0/ETXFm5z/OR3VY652seHV+S9qFlMFChiv8sQ/ufuRAUxYiM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FMHeUvg4V35rtNI89bSKaamLcyISpEcbJjLY1o2vEg=;
 b=eE3Mcf1zkc5R4SVTUCCioGIwELmrDm60GckGF+3JFM1u2GcuRlaVeM+YZxR0F91zF+H4XFj/uAgWI+sjejgtBFX4K1IynM52ZV+2Trry6l+OhWXoA04A21ZtzmbjX+xIY8QKc4Jp1Wp4BtmtHVGpVsT+FFanxSalxsyqzLP93EE=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.85) by
 DM6PR11MB3867.namprd11.prod.outlook.com (10.255.61.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.22; Wed, 2 Oct 2019 13:35:47 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22%6]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 13:35:47 +0000
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
Thread-Index: AQHVc8VbrLXkUp4vH02J/Sk0g3X+4Kc9pRwAgAm/1IA=
Date:   Wed, 2 Oct 2019 13:35:47 +0000
Message-ID: <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
In-Reply-To: <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0095.eurprd04.prod.outlook.com
 (2603:10a6:803:64::30) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:59::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191002163523538
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc8c7090-0dc1-40c4-0494-08d7473d6ec1
x-ms-traffictypediagnostic: DM6PR11MB3867:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB386774FD333FC5FA3D48D789879C0@DM6PR11MB3867.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(346002)(39860400002)(396003)(376002)(189003)(199004)(51914003)(7416002)(6116002)(6486002)(7736002)(2501003)(110136005)(31696002)(3846002)(66066001)(86362001)(52116002)(305945005)(99286004)(2906002)(4326008)(71190400001)(5660300002)(316002)(71200400001)(6246003)(6436002)(31686004)(4744005)(8676002)(186003)(2171002)(6512007)(102836004)(256004)(1191002)(7366002)(66476007)(7406005)(7336002)(64756008)(66556008)(66946007)(14454004)(486006)(36756003)(478600001)(26005)(561944003)(476003)(2201001)(6506007)(8936002)(386003)(2616005)(53546011)(229853002)(81156014)(81166006)(11346002)(14444005)(76176011)(54906003)(25786009)(446003)(66446008)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB3867;H:DM6PR11MB3225.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jnq35Go1SdxUfLeV5q7JGdvdeI1+IDZRRiDqjq3AXlZiDtlTJzLbLr8etS7DJIJyFwgevBab4PbGIOR+8SDpnSmpLJm9Wl2VdYmucf8/AXrM5wlVSCC1twYujkjq7VGbNmmd3aUX2spK3yU9KMnBKc2SPJHTcVPJmK+hN1kAJQACrDOEOkiO4JSF8EuTlhSn30RJNteOKfgMQwGtIRlVwWA4B2jAhMQjajd45SChJbDEjEEBQDZa2Gss8t0AxaG6rLHVwb0PwqJaqdPl+f4O2JamhktKsqCdoHshwlOeUOtk6p2BwMYgx4iqTAkfCpzZz1sDlHzJYpBKiHPaVgfxHtMaRX8HWWlntMRcKaZ8pIp/pGa5RUwEcAED0UXDmPrQwMWL2pq6TeHaB3dA2KgHYPzInO0pAiiWXroGUKWt8QA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE320C98F40CBC4891F6ABBA6ED802E1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8c7090-0dc1-40c4-0494-08d7473d6ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 13:35:47.4953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uM7thGsCAHUYVrFTXDZRkjiPPWhO9D+fJViyd9P5Mert1IPyRm9jhVvgj7sQYDZQ7+QS6o72Qapr5vZMCv+mYyI4pE4gaUo6Brx1EpXdqw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3867
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgRGFuaWVsLA0KDQpUYWtpbmcgaW50byBhY2NvdW50IHRoYXQgUm9iIGRvZXNuJ3QgYWdyZWUg
d2l0aCB0aGUgc29sdXRpb24gcHJvcG9zZWQgaW4NCnRoaXMgc2VyaWVzIGRvIHlvdSB0aGluayB0
aGVyZSBpcyBhIGNoYW5jZSB0byBtZXJnZSB0aGlzIGRyaXZlciBhcyBpcz8NCg0KSWYgeW91IGhh
dmUgb3RoZXIgc3VnZ2VzdGlvbiBJIGFtIG9wZW4gdG8gdHJ5IGl0Lg0KDQpUaGFuayB5b3UsDQpD
bGF1ZGl1IEJlem5lYQ0KDQpPbiAyNi4wOS4yMDE5IDExOjQyLCBDbGF1ZGl1IEJlem5lYSB3cm90
ZToNCj4gDQo+IA0KPiBPbiAyNS4wOS4yMDE5IDIwOjE5LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToN
Cj4+IEV4dGVybmFsIEUtTWFpbA0KPj4NCj4+DQo+PiBIaSBDbGF1ZGl1LA0KPj4NCj4+IE9uIDEw
LzA5LzIwMTkgMTU6NDcsIENsYXVkaXUgQmV6bmVhIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4g
VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IHRvIHBlcm1pdCB0aGUgc2VsZWN0aW9uIG9mIGNsb2Nr
c291cmNlL2Nsb2NrZXZlbnQNCj4+PiB2aWEgRFQuDQo+Pg0KPj4gVGhhbmtzIGZvciB0aGUgcHJv
cG9zYWwgYW5kIHRha2luZyBjYXJlIG9mIG1ha2luZyBzb21lIHByb2dyZXNzIG9uIHRoaXMuDQo+
Pg0KPj4gSSBqdXN0IHdhbnRlZCB0byBsZXQgeW91IGtub3cgSSd2ZSBiZWVuIHRyYXZlbGluZyBi
dXQgdGhlIHNlcmllcyBpcyBpbg0KPj4gbXkgcGlwZSBhbmQgSSBkaWQgbm90IGZvcmdldCBpdC4g
SSdsbCBjb21tZW50IGl0IG5leHQgd2Vlay4NCj4gDQo+IEhpIERhbmllbCwNCj4gDQo+IE5vIHBy
b2JsZW0uIFRoYW5rIHlvdSBmb3IgbGV0dGluZyBtZSBrbm93Lg0KPiANCj4gQ2xhdWRpdQ0KPiAN
Cj4+DQo+PiAgLS0gRGFuaWVsDQo+Pg0KPj4NCg==
