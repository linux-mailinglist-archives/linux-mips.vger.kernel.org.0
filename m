Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 106938A525
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 19:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfHLR64 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 13:58:56 -0400
Received: from mail-eopbgr770114.outbound.protection.outlook.com ([40.107.77.114]:9445
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726581AbfHLR64 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 13:58:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcqTettayRHOXkpm9OY+HZad4uXIkB6QL5iAM5P6Cc3GlsEG1ILgzn9I7r1diY6i/MmRQnv5kKpSiB7hAb/8h2SsGRYasqcYUu4I9FXjEZwaNU6QPXS8utPbCIRYpgBQ69AkbJq2xlMW+xXS6slYnw4VW8hxn1v/JCNrU9eTBwbC1VnPjF4pHP6nAlNDLnzbKI4AgiBUyMHRLFt4cZSL/+PentXwb/ONtgksTfUgge52XJrK6LheJuQCfPMzhMw0d0EO7GbvoY9mZpkSn8vPtRBbqeaPDl6vMy1NX0yiEkoM6XU7bMUhzu+AQ3Dbyq1nUYjQHNWDTWzCI0BYPf++pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQ+zOhPWxWr/+OnIyGt25IXGG4WaR85Z0Ex+CLlDKFY=;
 b=UkKWw09JWzWtRrvpZF0HwIYegnampOzYSSavq6D7ZAmsjdb7e0pjvPaFC2Fwo75iHP7vEQQIVc1c89lqlZ7Ppoe1LjDn5TE1qj4iSkvPyD5pWDFAFTeh5MaV59jVbjPntVqYA1fF9GKjL7UOmO6oeyR5PgKxm9DTQcYqey8ecSdyQwTG7DiJde0wrQZaZwdjPhNFAJUkD1ImVoAB1KWerW7mT9aIOyx4MglV0K9AFHbFZUO5rD9IPesr52kVFv3DHxKhO9DRgglUPXnUVJ1W/KaYVjoGfI/NVR8YzbsBDx1bO3D+Z192Df7UITLyo52ktRNzJwE31HneZF1FljwscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQ+zOhPWxWr/+OnIyGt25IXGG4WaR85Z0Ex+CLlDKFY=;
 b=Fnd3Ga+ejMERnKCCkeknqL44i2VkNa2TEhZm5ro7siBgU3I90f+J+G3pMNZU6tA03MIyjel4rAMmf0I4UAGsTRnrz0T0aM3n8fxou8BpRDJzf9KkZcxDymj7KF2J+ha5NSUZBIQiT3oMB3rMmFty7aVUTdlKaPMG98Jk0q6kaHs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1104.namprd22.prod.outlook.com (10.174.169.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Mon, 12 Aug 2019 17:58:47 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 17:58:47 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        Vladimir Serbinenko <phcoder@gmail.com>,
        Jussi Kivilinna <jussi.kivilinna@iki.fi>
Subject: Re: [PATCH 3/5] lib/mpi: Fix for building for MIPS32 with Clang
Thread-Topic: [PATCH 3/5] lib/mpi: Fix for building for MIPS32 with Clang
Thread-Index: AQHVUTeWNolbWFJ6CkGezm0cPp8EqQ==
Date:   Mon, 12 Aug 2019 17:58:47 +0000
Message-ID: <20190812175846.ozvhx5a2sturrclt@pburton-laptop>
References: <20190812033120.43013-1-natechancellor@gmail.com>
 <20190812033120.43013-4-natechancellor@gmail.com>
 <20190812052355.GA47342@archlinux-threadripper>
In-Reply-To: <20190812052355.GA47342@archlinux-threadripper>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d66e9ba3-1cdc-4aba-1ce1-08d71f4eb953
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1104;
x-ms-traffictypediagnostic: MWHPR2201MB1104:
x-microsoft-antispam-prvs: <MWHPR2201MB1104BA7E25CC230D7145B3C8C1D30@MWHPR2201MB1104.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(376002)(136003)(346002)(366004)(39840400004)(396003)(189003)(199004)(9686003)(7736002)(14454004)(478600001)(6512007)(54906003)(53936002)(305945005)(58126008)(316002)(33716001)(64756008)(1411001)(66476007)(66556008)(6246003)(2906002)(66946007)(4326008)(3846002)(71200400001)(66446008)(71190400001)(4744005)(6116002)(76176011)(1076003)(25786009)(52116002)(6436002)(6486002)(6506007)(386003)(446003)(42882007)(11346002)(476003)(8936002)(26005)(5660300002)(486006)(81156014)(44832011)(229853002)(6916009)(8676002)(102836004)(66066001)(81166006)(186003)(99286004)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1104;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MJO84WnTJbYt8+QiUBpNwQYgfQgXmUHnRZT7Ev7KqcYYmCfinbhQEX3qmNZNlDiTgl/TiP4nzl/VnH7bCy+HjtVR/kaXHiq38v89qo6qSlchSTSka4U5ZJ0tWCDBJu7oexMl/nJ0cqu3VPTDcBlIpgLeE+ikYFizm7KbNcpWtFZtWttDecZVKAuIe+qm1O63WKmqafBLHduIBI3Zbl4oJxlf4RF0nKoDAFkZbNUGUMcQZzYaIJjTOYsJQu1QWblhnipXJDP7SWFjCg4J6x/EGgkFTAmS0ngAQ0vYpZYFxl+Pwhzg/VpV17YqXnXtm9QxlEG9mF3/PaqAd9lFlgn94gzO0x6G7vy5ieVhKe0vkF7y/5hKMB48PJqvM3dYCN9pjQ3Oo9R0/IAyOsHB+cxbeYv5l2CayrVlmrYof6jxRGk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <590DCDA92AE15C48BF35F3D7D623F45F@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66e9ba3-1cdc-4aba-1ce1-08d71f4eb953
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 17:58:47.7024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gtqlD9l3m7/KvqhvJcxvJMhvE0am6qMwLcVaz0yV8tb0CR/g/rvaNYS7BUMhoKQQZnpi1MweG1Y0kqtABJHAwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1104
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nathan,

On Sun, Aug 11, 2019 at 10:23:55PM -0700, Nathan Chancellor wrote:
>  I noticed you didn't pick up this patch with the other ones you
>  applied. I just wanted to make sure it wasn't because it was sent to
>  the wrong person. This set of files doesn't appear to have an owner in
>  MAINTAINERS, I guess based on git history either Andrew or Hubert (on
>  CC) pick up patches for this set of files? If I need to, I can resend
>  it to the proper people.

The 3 arch/mips patches were trivial for me to apply because I'm very
familiar with the code & know they should go via the MIPS tree.

I'm far less familiar with lib/mpi & needed to look up maintainers,
which is why I didn't apply them in the few minutes I had spare.

Thanks,
    Paul
