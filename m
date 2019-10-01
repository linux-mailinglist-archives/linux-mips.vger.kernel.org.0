Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9944CC442E
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 01:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfJAXOG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 19:14:06 -0400
Received: from mail-eopbgr750112.outbound.protection.outlook.com ([40.107.75.112]:41204
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728528AbfJAXOG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 19:14:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNlaIG5g/lUMh/bvp62oKz/6UawYntXV6G9Eu1+ivIt96cj0H9w/QKjmTDyfMzS0F52n0WnQKZF+xty3ELx1xfKMLbyec2FgnylmOUXmjNawFhiZJqHQA+YfUOzj8mT9bQOi50l4kZUFPmo6lh8YfjFrMZVRtAuGhBDidFTRfCRYX3vGsE4oZBSJWPNMQ2U7HC66VLvax8RGO1tbLtWVa5/8Ox+8tY+Zr9I1XeOOPMLb6tugXbsnVpr6SlAGDGmtp349J+7Ark89W9xAHbV7qJ6OfbIiHD7mC7SwViGTrkm+FNpznruoX6AjFZ2MH69pt/gYUe0M0Stb4LFH8y+Iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7JViKhb8AhpA1H34+0YYUSk6nQGlBkiovvI65J1xJo=;
 b=SAaK9KuQp2tcLuHEx73DXouDOriAfw24DwmT3/pANx5rIQB22JPSYkBnjY5Ra34jfr8rx9EpCF9CuOKBqb95Wy+TZtyYmlEo7ktk5GAxmlrGLmW5yY1RQayi/XCPX/DcrfWziXWnATCoNqOssO/r4BlV+HRTsAAG0daW8hFLoJO6wKFBt5JTUioKpD4RdtKABdivY309bjxkErDZxcj9oV7yHTd/Ld2+A+re8UlN4VaR4yk9sCJYn16n4PfUuQKDRAwoYVXzQpyG4eqt4a92h0sT+K3/Mz+v6qx95yPnVG7Qf29AnjADEEkedplbNc109Q7OWIoqa/zUy/PvWEQT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7JViKhb8AhpA1H34+0YYUSk6nQGlBkiovvI65J1xJo=;
 b=OWxTv9fz5mDnxmEA7Uw4O0j5mWDifoaa8i5HPuAUFUzDFtzofMCpp/FpltMqWbLkdYsK8gJhXgOSsbkdA7QGis/ITnVY+MZ3KLC+DfIfJLd7xPAsm3bAAdBpDRDYn82KVo/+Xhpe1dGO59ClDyrtrJZ6+DIdqwrqlOtdrttPQ44=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1328.namprd22.prod.outlook.com (10.172.63.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 23:14:01 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 23:14:01 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Alexander Lobakin <alobakin@dlink.ru>
CC:     Dmitry Korotin <dkorotin@wavecomp.com>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mips-owner@vger.kernel.org" <linux-mips-owner@vger.kernel.org>
Subject: Re: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
Thread-Topic: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
Thread-Index: AQHVeK3pFynOU+aQEEeaJnVK7RFEnw==
Date:   Tue, 1 Oct 2019 23:14:01 +0000
Message-ID: <20191001231400.cjge7xocdesmx7pf@pburton-laptop>
References: <CY4PR22MB04717E7C68389573AADA4E99AFB00@CY4PR22MB0471.namprd22.prod.outlook.com>
 <1563c90e9d9ed42bd1dedd552fa0316a@dlink.ru>
In-Reply-To: <1563c90e9d9ed42bd1dedd552fa0316a@dlink.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.153.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86de2314-ff2a-45f9-08b9-08d746c50bbe
x-ms-traffictypediagnostic: MWHPR2201MB1328:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1328555B3BA028182AAF88D5C19D0@MWHPR2201MB1328.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(7916004)(366004)(136003)(396003)(376002)(39840400004)(346002)(199004)(189003)(81156014)(99286004)(6506007)(386003)(76176011)(52116002)(81166006)(6916009)(8676002)(42882007)(25786009)(478600001)(26005)(186003)(102836004)(446003)(66556008)(64756008)(66446008)(66476007)(66946007)(71200400001)(33716001)(14454004)(66066001)(44832011)(476003)(486006)(11346002)(71190400001)(14444005)(256004)(6486002)(6246003)(6116002)(3846002)(316002)(305945005)(7736002)(5660300002)(229853002)(9686003)(4326008)(1076003)(6512007)(54906003)(4744005)(58126008)(2906002)(6436002)(8936002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1328;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KtxyiFNxXYradhvcDuZ2YKRN795XapnhOEQmDFdIaAxwdNdCyuC736vsqVB85xyFJ9slqAKNBPifNSemmIe0i0FkohtJwvu7yEQYZlJCfbOyZzgAtK7GQ3LS/9j8JNfTjeg43QENRiMPKGiwoznJ1DAt536zPoZNFEV/pM1f8odNqwWi5pMHACx9nhG4Xi1Q7W57/ZVySIt6ULu5cX4y7qhI1c4jpMlXD4/di6NUc6nVmg/4/jYGYdp0mEGBfXrmxW7q2HfTKYMSvPgKjn5aZs6pOiJ/4nMVL1+nfV8+ELhKXjVMvl0yJdT7Uoz9rXxeL2CKWI33VCFN+ExOoOrSv9CnmKQEm+D7qivacSTd604uZuUyWUV5zbIDgpxpbc8c0xED6411IfkbLYpAtZ7XV8VR5GK0kD8fXg/+Qea7wmc=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CDF2EE085A79E545960DC897FDA42464@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86de2314-ff2a-45f9-08b9-08d746c50bbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 23:14:01.7228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdFII/zm6Bez8+L6OzYsabX+laZWpXpzLOr4+biYRaNnD5heFtNW5mbJpw9sq+43eHCVSf/8SdRwIyd4Lz1F9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1328
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexander,

On Tue, Oct 01, 2019 at 03:49:56PM +0300, Alexander Lobakin wrote:
> Maybe it's time to remove the "rather naive" block under CONFIG_32BIT at =
all
> and use C implementations in all cases? I'm interested in what does Paul
> think abous this.

That's not a bad idea - it's something I've already been considering
doing anyway as I slowly prep for nanoMIPS support. The reason I haven't
pulled the trigger yet is that I haven't had time to verify the
performance impact - I expect it to be minimal, perhaps even beneficial,
but it'd be good to get numbers from a few machines to check that.

Thanks,
    Paul
