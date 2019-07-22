Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4035370B38
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731339AbfGVVWP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:22:15 -0400
Received: from mail-eopbgr730119.outbound.protection.outlook.com ([40.107.73.119]:16697
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731324AbfGVVWO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:22:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjegWhG2ncYu1b5d8tJ5Q+RfWkF5LDHDubnrHniRv3wRGyk9JH0Us4p2ty9yvZlIf3CZyohu4WE/4dKbWvMXYh+GZUyZ/PZE9fnCDbtZvfv3eONS9KBE9+lJSvt0BeKZUUpOe+rCvnKl4PGdJekwnMJI96aDbvKSx8eN+Pjh7It3DUR6QZjK6/qhCoHm2BBdOKRz6Ihu8WJcNk1dW0Fef6QqjXfEI/zRuYxXU5cjE60FRGEwytj9QWF529qDiISVFIN6Lb0udQMgX3s2Qs7zIpExunx+8VJNlsrPd7NvzKtrAKvfnWpEZq3xL40BD7UKxM75COzispcujfwhkzS/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPjeK+PW/nLpr/ex7ijuVDzDhLKziMWvA/4j/ArcaeU=;
 b=mRm/hMXW3EB6i76gjJBsyEXftUHv2PPwV5fckOysXiNiF6aMOJq2scqb/nrjecaz+6y07+0eG+7w5wDLffmKc+Y7R3M5z4WSPjaaoMr72wQI5JiTnjJCb1Nu1uYJBjw5E/M6z8hIN/4bBy7ul5VB6BPHQroy4fz1MYkfkb8h8eu73RMLA68fU4/F0e3EtnPSK/EIBjWFimDLOMSdk5AGdeRNaBLii9gJcE6dmj90zT5FJeJAqkPRTZzpR/Q+PvIkU90UHEe3Sf+YUIlMcVSCefpJnWAC4UhYUjv0FTCzt+QMeH2/S1LrNSmTSC0rkqJR+PodK6zDzdYFY5WW53C+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPjeK+PW/nLpr/ex7ijuVDzDhLKziMWvA/4j/ArcaeU=;
 b=BQ9dbArHo+Pis+8+Cigt4Hf8YZJZQpXu/wPOYgUtPIE49r/mp/9FFxFLC4/AKSTJK6VBg0mMMr9QnaPiPbT7L/hDcMrG/eiwki5ZopwJbhYWI13jptmENroLQRRYxbOHniHq+El5mNICVFrNFu3LgVPItqnlSAU0tf0k3aq4KR4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1757.namprd22.prod.outlook.com (10.164.133.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:22:09 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:22:09 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Jonas Gorski <jonas.gorski@gmail.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 3/3] MIPS: BMIPS: add clock controller nodes
Thread-Topic: [PATCH 3/3] MIPS: BMIPS: add clock controller nodes
Thread-Index: AQHVAOJ07NmoWXat5kax173VTxnICKbXpUMA
Date:   Mon, 22 Jul 2019 21:22:09 +0000
Message-ID: <MWHPR2201MB12779902806554FC4416BEF3C1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190502122657.15577-4-jonas.gorski@gmail.com>
In-Reply-To: <20190502122657.15577-4-jonas.gorski@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07302cc8-cb02-4834-202c-08d70eeaa7b4
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1757;
x-ms-traffictypediagnostic: MWHPR2201MB1757:
x-microsoft-antispam-prvs: <MWHPR2201MB1757D08656F678BC0BB8E67BC1C40@MWHPR2201MB1757.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39850400004)(346002)(136003)(366004)(199004)(189003)(66446008)(66476007)(3846002)(6116002)(4744005)(66556008)(66066001)(6436002)(64756008)(66946007)(52536014)(25786009)(14454004)(476003)(7416002)(8676002)(6916009)(9686003)(305945005)(74316002)(7736002)(99286004)(71190400001)(52116002)(256004)(71200400001)(4326008)(6246003)(26005)(81156014)(68736007)(186003)(8936002)(81166006)(2906002)(478600001)(486006)(11346002)(446003)(5660300002)(55016002)(53936002)(316002)(54906003)(42882007)(33656002)(386003)(7696005)(6506007)(102836004)(76176011)(229853002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1757;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W/BBXIENidYUuk/9xdRd65NfbEBumjR/RPJvSV24cM/RtcIVTfj63dnpQItZEmD0gaMYgY/KPeEXxFwRpZa6SM1ysvUA6MDS5H6+oR+oewHt7cnPJvr24ywuTIpavU8GdtgtQpEViRnUabG/brsl/JX+Nz1R3JxMNw+oUgwOguKhYjTcJt58RFQUP38qt8emtkUcuPPrjVc5XrelyTAQOMdpoxc7igEDckzQIgYEiMxvuD3XRLQG2iOfWeoR3uwtuRODnM6hQGpkaiwo5MS1hx91KB1nSDOKQNqLlm4cFCTC7YKUaWfGCDQy6lpOhFB9VJze5OfKBJJUbRtoJ5Ep3jZQZBrLC7bXp2qoQioJbnuSQxshgf1BsxXKYu2Gfvcwey6rT2ySsv89HZ5OVV6Ma/F+zDF8UoEIL6n38iLr2mI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07302cc8-cb02-4834-202c-08d70eeaa7b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:22:09.7872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1757
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jonas Gorski wrote:
> Now that we have a driver for the clock controller, add nodes to allow
> devices to make use of it.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
