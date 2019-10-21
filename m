Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCB3ADE73A
	for <lists+linux-mips@lfdr.de>; Mon, 21 Oct 2019 10:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfJUI6S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Oct 2019 04:58:18 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:42625 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfJUI6S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Oct 2019 04:58:18 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: WEj1RSGINlH0YP7nNoiViAPn5fKFEykpOmUAsfeXVHQ0ptRTq9IpWZydSiG1TTXVqc+rNAMCa/
 9g8VAxylPb52ieSRnXN023ATEiHh15sJrP9LRA/gLvEfORXrjE8Ff4VovtElpoPzXALRS2RyKR
 UTafdxNN4tSsDQl7Ysd8k345wN1/xMrGFno4nYmeH6fMCcZlPmhuetz3JpZ4FubkklDDCD3lVe
 zYQdyHnncGWMnn7IPVTn7h96BeUeQdnMwgkzIWrgvfPEvPUdaJJ7hA0PLu/s3eaa9nqXhHUS7P
 E08=
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="54996746"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Oct 2019 01:58:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Oct 2019 01:58:12 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 21 Oct 2019 01:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVxpEboKD5DSydpkrO0hbX/rigOqbuO5TP6ccH+2DzAFCGEaO5ljvmIbi9Fu1Jo53ItQGCCUz5JSZV0Ib8u+NlWkjfyUTQRz9t+msHA2hqkhmlrnoU/llKTMp+J9SJ+ZgRJjGykn8azB+YrdH+4kTKKyfGfzUechUffjngE7m6GKtCAcr4UuKMYxCNF2kOHu7a+yK9ZPpXo3uI/J0xAw0YaYa/T60PdL8t9AK3IQ3NI5Ax3EKBENOAl+VH1MlCj1x+40F+v54pSuUilkCE8DCECziiuPx3wMEkoB8qTE4Loe1fakmb5ZZ8eRWzgHYA6sEzgnVL60z8dhtwcWREy3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wpk8sLUcO1HMbgN1/NAq9gdAZbl2KgQ3dc/W6Au6XM0=;
 b=LKmKWGJmAsZaXX3+cpB4qWFxtZdyXFdbJIeIlMIJl2zf+7l+TJ+C+bznjNHBWur1PnqY45GpcCpwBopzStdU7c7QJH9dEa83PsmlFcC/M4oaqnE5FyAq8fixilRSKb3BT9NL/NTbf+G2JHP7j2hFIpdXvpW8cfPNDmwe8ZrQMUlCp0Hl8RJ+LT6967I00ajrJbDHX0hwscoSTwIKPVikxcVrUfCDL833NXmHBlfYkX1SG8Wc/TCfV2bJ3Yqk8DncLuNNi7+N/VtWLtVkM7uxlcJeskQnrMPq1p1nRX2xR+yCws9cpSY1TZVOTQQH5NYsiRDxQcV1M08RBe51lpMbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wpk8sLUcO1HMbgN1/NAq9gdAZbl2KgQ3dc/W6Au6XM0=;
 b=pxr9UaNpSC7Br5tgOLkO3zHprkIgLGONPrpbtdj2C45CdFZnAwPkknwXUKT0HqMmb+e3UMmEqtFsLITRZH0xhOJsj8EO8rgfFo4QfBQlL7+Vj7eg4qD7WLXp0CE7N/zFiOa3VmQiyRqkS5e3hANOIFZlhDOIHBhKiQw1IvecwNA=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.85) by
 DM6PR11MB4234.namprd11.prod.outlook.com (52.132.249.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Mon, 21 Oct 2019 08:58:11 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22%6]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 08:58:11 +0000
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
Date:   Mon, 21 Oct 2019 08:58:10 +0000
Message-ID: <215a1cd3-b1a8-5171-d70c-8d8081038e7f@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
 <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
 <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
 <14df6e5d-19ef-4ebc-fd11-9953bc3fc44e@linaro.org>
 <7071b6fa-f7ed-c879-4a43-44100dbe6121@microchip.com>
 <8e9f709f-2ded-c666-26e0-9235d6107c34@linaro.org>
In-Reply-To: <8e9f709f-2ded-c666-26e0-9235d6107c34@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0421.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::25) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:59::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191021115748754
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3810ac50-35e2-4d42-7e6a-08d75604cc1f
x-ms-traffictypediagnostic: DM6PR11MB4234:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB42347F81DD4DE1159ECD573287690@DM6PR11MB4234.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(1191002)(36756003)(316002)(478600001)(5660300002)(14444005)(256004)(8676002)(2501003)(31686004)(6486002)(31696002)(229853002)(66066001)(102836004)(81156014)(6512007)(81166006)(6436002)(3846002)(52116002)(4326008)(99286004)(7406005)(2906002)(7336002)(6116002)(7366002)(2201001)(7416002)(110136005)(66446008)(66556008)(66946007)(66476007)(76176011)(6246003)(54906003)(86362001)(8936002)(71190400001)(71200400001)(25786009)(14454004)(11346002)(2616005)(446003)(476003)(386003)(6506007)(53546011)(7736002)(486006)(186003)(26005)(64756008)(2171002)(305945005)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB4234;H:DM6PR11MB3225.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BrURRVHxFOouoiEdT0XbRFhNbwLrjgICSsKdC1OVvjMDSPo2aviQut/pZmL6HMZKpmcEV97WzzAl7rTGFjlLCOoePFDwzRYPak3rKuYeuLRsIRO3gW7ayTGeDDucDl9w/XQG+vAup3pdj1PQJVZunDjh+4/+TGPP1DhTC625LXkUP0XrUptDb5rCpri00nNsoRpPSGdIW8UzSrhqXeuyLBkTLoQISGV1uyRV+PdI+rOyUI6WmRgMRXO95grqzacoGYQqRGoX0iDlhpbXvbHva803pt9flPrVjd+V6dLrjm6+EAa4L23DAe1MqTf/qDrY0EZh8GCP7PDr96MqIH38pXDhJAuFssZzo1l3wxv9mk8flNfDWzNGn3D8ylRo4lbZA8QDzObqbkeIU/74rIXVUclo14lTM2XsZITYDK8IbroE/uSqDKFwTk6tbmCdUad5
Content-Type: text/plain; charset="utf-8"
Content-ID: <60F94980C60DF447B0B88B0D90F5A4BE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3810ac50-35e2-4d42-7e6a-08d75604cc1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 08:58:10.4876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTVZQGsCKvIe/8hNUSvF0owHehWJYzdiVDOMD3guyXcrA6p8GMydRkwxoWKIu99kzwLS+96zH72X1Ru6hK3krIEC608LEOoTiq4/TfVr4Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4234
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgRGFuaWVsLA0KDQpPbiAxOC4xMC4yMDE5IDIzOjI0LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToN
Cj4gSGkgQ2xhdWRpdSwNCj4gDQo+IE9uIDE1LzEwLzIwMTkgMTE6MjMsIENsYXVkaXUuQmV6bmVh
QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+IA0KPiBbIC4uLiBdDQo+IA0KPj4gVGhlIHRpbWVyIGNs
b2NrIHNvdXJjZSBjb3VsZCBiZSBkaXZpZGVkIGJ5IE1SLlBSRVMgKyAxLg0KPj4NCj4+IFNvLCBJ
IHVzZWQgdGhlIGNsb2NrLWZyZXF1ZW5jeSBEVCBiaW5kaW5nIHRvIGxldCB1c2VyIGNob29zZSB0
aGUgdGltZXIncw0KPj4gZnJlcXVlbmN5LiBCYXNlZCBvbiB0aGUgdmFsdWUgcHJvdmlkZWQgdmlh
IHRoaXMgRFQgYmluZGluZyB0aGUgYmVzdCBjbG9jaw0KPj4gc291cmNlIGFuZCBwcmVzY2FsZXIg
aXMgY2hvc2VuIHZpYSBtY2hwX3BpdDY0Yl9wcmVzX3ByZXBhcmUoKSBmdW5jdGlvbi4NCj4gDQo+
IEknbSB3aWxsaW5nIHRvIHRha2UgdGhlIGRyaXZlciBidXQgSSBkb3VidCB0aGUgcHVycG9zZSBv
ZiB0aGUNCj4gY2xvY2stZnJlcXVlbmN5IGlzIHRvIGxldCB0aGUgdXNlciBjaG9vc2UgdGhlIGZy
ZXF1ZW5jeS4NCj4gDQoNCkkgZm91bmQgdGhpcyBhcHByb2FjaCBpbiB0aGUgZm9sbG93aW5nIGFs
cmVhZHkgaW50ZWdyYXRlZCBkcml2ZXJzOg0KZHJpdmVycy9jbG9ja3NvdXJjZS9hcm12N21fc3lz
dGljay5jDQpkcml2ZXJzL2Nsb2Nrc291cmNlL2JjbTI4MzVfdGltZXIuYw0KZHJpdmVycy9jbG9j
a3NvdXJjZS9iY21fa29uYV90aW1lci5jDQpkcml2ZXJzL2Nsb2Nrc291cmNlL21pcHMtZ2ljLXRp
bWVyLmMNCmRyaXZlcnMvY2xvY2tzb3VyY2UvbXBzMi10aW1lci5jDQpkcml2ZXJzL2Nsb2Nrc291
cmNlL3RpbWVyLXFjb20uYw0KZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fYXJjaF90aW1lci5jDQoN
Ckxvb2tpbmcgdGhyb3VnaCB0aGUgZG9jdW1lbnRhdGlvbiBvZiB0aGVzZSwgbW9zdCBvZiB0aGVt
IGRvY3VtZW50IHRoaXMgRFQNCnByb3BlcnR5IGFzIHRoZSBmcmVxdWVuY3kgb2YgdGhlIGNsb2Nr
IHRoYXQgZHJpdmVycyB0aGUgdGltZXIsIGJ1dCBub25lIG9mDQp0aGVtIHNlZW1zIHRvIGhhdmUg
c29tZSBJUCBpbnRlcm5hbCBkaXZpZGVycyBzbyB0aGF0IHRoZSB0aW1lciB0byB0aWNrIGF0DQpk
aWZmZXJlbnQgZnJlcXVlbmN5IHRoYW4gdGhlIGNsb2NrIHRoYXQgZmVlZHMgdGhlIElQLiBGcm9t
IHRoZQ0KZG9jdW1lbnRhdGlvbiBvZiB0aGUgYWJvdmUgZHJpdmVyczsNCmRyaXZlcnMvY2xvY2tz
b3VyY2UvYXJtdjdtX3N5c3RpY2suYw0KCS0gY2xvY2stZnJlcXVlbmN5IDogVGhlIHJhdGUgaW4g
SFogaW4gaW5wdXQgb2YgdGhlIEFSTSBTeXNUaWNrDQoNCmRyaXZlcnMvY2xvY2tzb3VyY2UvYmNt
MjgzNV90aW1lci5jDQoJLSBjbG9jay1mcmVxdWVuY3kgOiBUaGUgZnJlcXVlbmN5IG9mIHRoZSBj
bG9jayB0aGF0IGRyaXZlcyB0aGUgY291bnRlciwgaW4NCkh6Lg0KZHJpdmVycy9jbG9ja3NvdXJj
ZS9iY21fa29uYV90aW1lci5jDQoJLSBjbG9jay1mcmVxdWVuY3k6IGZyZXF1ZW5jeSB0aGF0IHRo
ZSBjbG9jayBvcGVyYXRlcw0KDQpkcml2ZXJzL2Nsb2Nrc291cmNlL21pcHMtZ2ljLXRpbWVyLmMN
CgljbG9jay1mcmVxdWVuY3kgOiBDbG9jayBmcmVxdWVuY3kgYXQgd2hpY2ggdGhlIEdJQyB0aW1l
cnMgb3BlcmF0ZS4NCmRyaXZlcnMvY2xvY2tzb3VyY2UvbXBzMi10aW1lci5jDQoJLSBjbG9jay1m
cmVxdWVuY3kgOiBUaGUgcmF0ZSBpbiBIWiBpbiBpbnB1dCBvZiB0aGUgQVJNIE1QUzIgdGltZXIN
Cg0KZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1xY29tLmMNCgktIGNsb2NrLWZyZXF1ZW5jeSA6
IFRoZSBmcmVxdWVuY3kgb2YgdGhlIGRlYnVnIHRpbWVyIGFuZCB0aGUgZ2VuZXJhbA0KcHVycG9z
ZQ0KICAgICAgICAgICAgICAgICAgICB0aW1lcihzKSBpbiBIeiBpbiB0aGF0IG9yZGVyLg0KDQoN
ClRoaXMgaXMgd2h5IEkgYWxzbyBjaG9zZSB0aGlzIERUIGJpbmRpbmdzLg0KDQpJZiB5b3Ugd2Fu
dCBJIGNhbiBzdGljayB0byBhIGZpeGVkIGZyZXF1ZW5jeSBoYXJkIGNvZGVkIGluIHRoZSBkcml2
ZXIuDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyB3b3VsZCBiZSBPSyBmb3IgeW91Lg0KDQpU
aGFuayB5b3UsDQpDbGF1ZGl1IEJlem5lYQ0KDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiANCg==
