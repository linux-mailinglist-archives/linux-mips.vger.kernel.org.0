Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079FC70C96
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2019 00:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbfGVWaQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 18:30:16 -0400
Received: from mail-eopbgr780132.outbound.protection.outlook.com ([40.107.78.132]:22071
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727391AbfGVWaQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 18:30:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJnim2IU98EVc66HRy4GdZa5nsBYmoP1A+L24UNHqBwyrcgdCdQOCFc+ZOYauejnm4ZLD2Gce8jwPX+1tVAxvvdhrinxJCE6h64yo+MdgD8o+gG0K7InEDqDBZf4S4g9OQed8ExZ81+yzKPhePrwx4Rs5Yg27eT7Ym+dMIQak7iOtMQ3/x3CFHURwrQYxyGXFQPnSj1QDTIDE84GTTuETiyC3YJViga65IHD+RPMcYFqgjZJ6AuLbHHDcbK5zJoMknJcHi/J4vdIyfI1wrdOan/hpOjXDnXwNYiCtl8VyZg5QUha8RDrSGk+28r7sfxXvGNxuXB8m5/2UPPdzgdnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9KKQW4jLDVN+fN4Qkc5K3fVLzTzLkv364zQNYsEd5E=;
 b=KzgnFEd5itoD0y2swS67nsq0denlUxqQ/N7AVRlr/2KVPtqtxdjrQHqIvHRwaQU/ySHyp6ZBzSRoG5pSuA43NKari58JZFxABZ/ENDK4KLYnzqgpcspDQmC9YDxeUdRYwlctjPX2Zed8DnQaPs5N/Eb2AtVcn7FkbaNR8ATkuSOcyiPMy7UEMP3zLlj3q7XVbV8dfdmnNSFI4sRlXAa9VOuqnOrhrqcsoHcHs0Rj9mR1Wq+Ucps0C1tHCynj9nYqbnXK62+gFZm4b2rYiU471RH/ZD5a43d87mfXomlxjMKE2fTsMsIyHmQYLV6uWsuk4WQpUbQfs9rAPcVs+XgWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9KKQW4jLDVN+fN4Qkc5K3fVLzTzLkv364zQNYsEd5E=;
 b=DhhtgYQ6RJmq8mSM0P3lo0sbY8mxtM5AM5wpFA+NYuWPiEDK6i1Spn006FcTvaQix7TlY56TRKU8lKNtrTcm+Wa2UyoMKQlkaUJu2UKgkC+pmdQfGxt6t8sEn9pKjo9sqymbkdxMu3/WKN7dnRiF47vF/wI5gviza+B0MF/fAHw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1263.namprd22.prod.outlook.com (10.172.62.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 22:30:13 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 22:30:13 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 3/3] MIPS: qi_lb60: Move MMC configuration to devicetree
Thread-Topic: [PATCH 3/3] MIPS: qi_lb60: Move MMC configuration to devicetree
Thread-Index: AQHUtOnv7zPPnVbgU0WD2elaw/ItfabYUDkA
Date:   Mon, 22 Jul 2019 22:30:13 +0000
Message-ID: <MWHPR2201MB1277E59D5FC1D9BE944902D7C1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190125200927.21045-3-paul@crapouillou.net>
In-Reply-To: <20190125200927.21045-3-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0068.namprd02.prod.outlook.com
 (2603:10b6:a03:54::45) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03ece5fd-3d20-403e-b51b-08d70ef429e7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1263;
x-ms-traffictypediagnostic: MWHPR2201MB1263:
x-microsoft-antispam-prvs: <MWHPR2201MB1263B24061C7B0DAF70A934DC1C40@MWHPR2201MB1263.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(366004)(136003)(376002)(39840400004)(199004)(189003)(76176011)(8676002)(4326008)(71190400001)(71200400001)(476003)(305945005)(7736002)(74316002)(102836004)(316002)(33656002)(81166006)(8936002)(81156014)(7416002)(54906003)(2906002)(99286004)(486006)(11346002)(446003)(7696005)(52116002)(4744005)(44832011)(26005)(186003)(6506007)(386003)(42882007)(68736007)(6116002)(3846002)(256004)(52536014)(6916009)(55016002)(14454004)(478600001)(6436002)(66476007)(66556008)(6246003)(66946007)(64756008)(66446008)(25786009)(5660300002)(9686003)(53936002)(229853002)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1263;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /9V4BbF+HVx8i8vMbo1NUiXeVHSiutOZbsny1tH0ipKgzs0F2EixDVC2JIaxfNF3KUApa8xsSkLGYyWVqkqgajGaGKcBRmbHtB9gfcIAgxOr/FZucYHBrkTwHI++euSnpiPNLTyIaZ01GnYyc1gsU83HY98TnQhoNwb+4jjn6I3uqdZIHP+isr85ag1EgHbYkljM8pM5Q+EoCT7yztUPF392Pkmkwjmf6zWn+X5J44opoEvwF3EgGvfMFiUn9nV16YLjV4mRPSU18wjDXtcnoIH7YON8v+gO++Z+wS0uR/mqEeaSYI1YZr6ByuT75RrRL6UpCNN6cWk9uCBBIEomla1qpGYpFaeoD9vhMR5e99W979B5bLhuLTQ2Bu63iQW9b/m/Noj6Zc8zyLbdR0/IjNDgS76tbXLJ8Mg8qgjYirw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ece5fd-3d20-403e-b51b-08d70ef429e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 22:30:13.6126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1263
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Cercueil wrote:
> Move the MMC configuration from the board C file to devicetree.
>=20
> The 'power' GPIO was removed and instead the vmmc regulator is used,
> to follow the changes introduced in the jz4740-mmc driver.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
