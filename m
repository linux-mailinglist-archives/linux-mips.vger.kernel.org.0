Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F69CEB08
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbfJGRxg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:53:36 -0400
Received: from mail-eopbgr820127.outbound.protection.outlook.com ([40.107.82.127]:42176
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728187AbfJGRxg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:53:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5ucTa9lRiidyO65d+Z6WeQoguJBPt7HJ9UeTZCCNNtx/8lIiwQnmGAKkikLZvaQpDDli3y8EzqQx7abjp/ULQfzd2TNXP6skq2g0I7hRvnZ6x34OYisEqN588VvR4t6CSKKZ/0Qgh9mB0lY+WPk6m/c7vQTlIkH8rDqAV5lxcFZShXd+m5d3zLAcqLI6ztQdypDuKn7Je18L0u64p6n5/Rt2ONXRQ2Ij2h9LBd/yPZeiwmzN1+AyqWA+7Jb0FFqEpWdfO8z3pt8hhQRmy+jCrTMn3sLHo8h68+rbJQbxPZ0azvW6kmXSUAJeDLBYTWfsqklPjkA2LYIuZcvbsXW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/G5oQUh9+kI/Ba5gX7iq/zDlHuSKDYGxjfX+489rH4=;
 b=klkS0zd50OFCM2mWXZu5hkJ52MOL0WWbd0BYv7ZI4ICMrmkZ6feV+bI+vQxdQVuWgvvg60wLz7WpbN7TGKhbxC4GGUktOBFzZzgKb/gn/jfeh2uDtd+pF0ib5IFL4Gy0nfomNalySR1S2S5vqrtTHSRYSZxz78xtzHRHcTg1ZtPUTyyB+tr+VKzpE108Nd/ZqTSCIdbwI/X7QQJPmsAaGPZI0GbeCOF7ofH8iFvBPuuNcyZrrclBCWB5hpBOQ6tqnln8Q7/izrUBdIW2o6mtK9PVML4fTCuNKd7hea/dgrr6JeleMBatyaLLTMfSFnZwQfiJAs4OU9vWDR7XqipdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/G5oQUh9+kI/Ba5gX7iq/zDlHuSKDYGxjfX+489rH4=;
 b=Av+aZWsXJoKbA62hbpvyZ7pdA87z+lMxr7c6pfhZ6sNwQbPvZ9Xm54K+seIS3VnI1X2vdBdvWh5LrHQgjJGWs4kKkXdtKO8mSFUI314XSGDyKA8qu0TdfZ5tO402IYiSXFyogl4hqHpzCCQ2lHamLmF1munz+5ApU07IjK20eNI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1104.namprd22.prod.outlook.com (10.174.169.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Mon, 7 Oct 2019 17:53:34 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:53:34 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Mike Rapoport <rppt@kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Thread-Topic: [PATCH v2] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Thread-Index: AQHVfTgj5T8EwIEneEC/yyJMaTPXnQ==
Date:   Mon, 7 Oct 2019 17:53:34 +0000
Message-ID: <MWHPR2201MB1277AFDF6B3F2E646FA5B6B6C19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1568632390-20893-1-git-send-email-rppt@kernel.org>
In-Reply-To: <1568632390-20893-1-git-send-email-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8619c18-c044-4fd1-c2b2-08d74b4f459e
x-ms-traffictypediagnostic: MWHPR2201MB1104:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1104006D420E0D16BF795A54C19B0@MWHPR2201MB1104.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39840400004)(136003)(366004)(346002)(199004)(189003)(71190400001)(102836004)(8676002)(76176011)(7696005)(229853002)(52116002)(4744005)(3846002)(66446008)(81156014)(81166006)(64756008)(6506007)(66556008)(5660300002)(6306002)(8936002)(55016002)(26005)(386003)(6246003)(6436002)(99286004)(66476007)(66066001)(6116002)(186003)(25786009)(71200400001)(9686003)(42882007)(33656002)(478600001)(66946007)(486006)(305945005)(476003)(6916009)(52536014)(966005)(446003)(11346002)(316002)(256004)(74316002)(14454004)(54906003)(44832011)(7736002)(4326008)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1104;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UzpJMX15nk5ni0rFb9/GKIl+G7bbjkfPbHoFGDm/dYS9AInBBahUJ7oaOcsOiA5OMZxwk/zlOJGMEosYfS2mAvsnXET/ApB9B0rleh5/aaMAXSKXsWU41SgKGacPUgTYNVxmTuVTEnI1/2pl9J9ycA0B2jk02ToD/dhvt37sJqKoJwVTTJrDZ1pabW3A5sQ2JKEPscsE6P7fxi8WRJqOTDF6HzM/JZlzy2mkqXRUm2JBb4X1JYLPJbOqFgRoT7jYqKnd2jgzoed+m71gJmGBhk3DUTj9pXjE2hLEPiWAceBqgYEcT+3DNr9jqDtpEhc9SXUSYxw6mG4kGLEJH+e+UmR5nP3lSuMaCM67ratB511+/dLI+r5wVBeBKdf3rxicfrQHdGN6sP5oA8tI8U/pIu9u8AT0cpQ7lNcSdTNHCnb2LOR4YOIPAU0kOhkkq/hQwz5CgAB0SfmBhG3R3i3hOQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8619c18-c044-4fd1-c2b2-08d74b4f459e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:53:34.1815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0RlU80bFNTWEqf5FhoN5nAxeNDG0K0V0csxeDmPJUgM0sdI/fGB+o/5DVp5rwYaWzBU0AVG/vdOdfLhOFPfNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1104
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>=20
> The memory initialization of SGI-IP27 is already half-way to support
> SPARSEMEM. It only had free_bootmem_with_active_regions() left-overs
> interfering with sparse_memory_present_with_active_regions().
>=20
> Replace these calls with simpler memblocks_present() call in prom_meminit=
()
> and adjust arch/mips/Kconfig to enable SPARSEMEM and SPARSEMEM_EXTREME fo=
r
> SGI-IP27.

Applied to mips-next.

> commit 397dc00e249e
> https://git.kernel.org/mips/c/397dc00e249e
>=20
> Co-developed-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
