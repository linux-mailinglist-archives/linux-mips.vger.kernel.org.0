Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF1FAD0548
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 03:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbfJIBh1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 21:37:27 -0400
Received: from mail-eopbgr790098.outbound.protection.outlook.com ([40.107.79.98]:17440
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729882AbfJIBh1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Oct 2019 21:37:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZM9DIHwIZFoSSSRGYTcXqAcEbmgNg61ijfVz17HRwxQgr8pMmUk3yLoY17R8rI7+G0Bk4TT4Ijl1RkYRPnj4lxhd0zdG9LFHaWNqJpMfgRyCSvgv1bWjJwuhPSUF0taudBFzOaypc6VrHMZlP8jqEOilUZxFsBKxkfuwCMI+rHGABfBKo3hkLm7fXqabnclHgQIoUfY+X/QkYfnr4t/caZFjRJrwBu27xy/6mdaG4xR+fW9kzjxsskKOIBiXE8Fqex83O9FRhvlAcPi5BD8m2n82SRSitoeyllBbbPAXVok5iOJIalhenhBQYRNqspEnebUowkAKCxPsMmKymZX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmYT8q8E+D9dersZKXt3E2yFrFYgVzTfP5C5mWUFbe0=;
 b=E5G9GS4cxJ3/qXKWQvQe1UpaFfg2UMXdLS2oobt6OjLIg2W9z8ECjCebBBwictUtIgnoGm97nOd8YlBGaLhNC7nGSvRjIqN/bXwEKfKCSdQ/y5LNFKFiTDzU2bG4pJnjzCqkUymUk9SB7rc/VQMWm8bNBDZrSQ1M7ozriWjVqtHoDcpJxVxC/yWjm02Hi4v3zHRIchcknu11RIE92WVGScT/GsbslcsQjg+zXQhfrXRJtQzE7FdKXBRVFhIh2p/pL23vrqtZrlQoS1HiEknWbR92rnsRI0D8hHmuAcBzZl06eWG476d+BfE3RHcOnhNtqvdloEK1m9acQnGAC8bfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmYT8q8E+D9dersZKXt3E2yFrFYgVzTfP5C5mWUFbe0=;
 b=r0WwhkMrrJhRMxhBhJ+2kcHBj1TIJKpyxomA+HFcrhMIIfDeehoIFL2ZaGddPdVoU8fI4DDh6f7U8joIyMnUgG0ZXmRN3/AcSvA8ZFmiqcqsM8nT3ag12zUrzxzrJ/O/5RXjkGHlUVJ2EJKUQ9PXeCVRH6VLUZLnRI3AUoBXYnY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 01:37:23 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 01:37:23 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     Huacai Chen <chenhc@lemote.com>,
        Paul Burton <pburton@wavecomp.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Subject: Re: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
Thread-Topic: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
Thread-Index: AQHVfkIZLU7mEtzrlkuoKTTOKk0bVw==
Date:   Wed, 9 Oct 2019 01:37:23 +0000
Message-ID: <20191009013721.qda2bo5teppr7nom@pburton-laptop>
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
 <MWHPR2201MB1277326D98BD1BFE0A5263BDC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
 <CAAhV-H5Lt8N5PQLXO7-VQbOkrWD3eRZC2sOKPcBb3LmK9GN-BQ@mail.gmail.com>
 <20191008180025.dtp2ingi6xgc5udu@pburton-laptop>
 <47416C00-69B1-4F85-902F-A770F25DD4C8@flygoat.com>
In-Reply-To: <47416C00-69B1-4F85-902F-A770F25DD4C8@flygoat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 766b8068-4abe-46c7-7835-08d74c593b92
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB137537981DA23612781A4664C1950@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(366004)(39850400004)(376002)(396003)(346002)(189003)(199004)(52116002)(476003)(81156014)(5660300002)(6246003)(8676002)(2906002)(1076003)(14454004)(305945005)(11346002)(446003)(7736002)(42882007)(99286004)(46003)(81166006)(33716001)(8936002)(6486002)(44832011)(316002)(102836004)(229853002)(66446008)(6512007)(64756008)(66556008)(9686003)(25786009)(4326008)(6506007)(54906003)(76176011)(386003)(256004)(58126008)(478600001)(6436002)(71190400001)(71200400001)(6916009)(66946007)(6116002)(66476007)(186003)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b32AKxmob4S+RoG8xiIdD0F/BGycD7ywo+TmCPbGyUORGM3DF+XxYUzYEDi7BzAJDfRyTcKXbcJ8O2jWCq0Na4hqobCGHlDKvwgYe7E7kO2139b7eoGt1Gco+CVia2k50uUkiWgPEg7SJr/5Aziy1Xsjr9HQt/hrvV/ehSe2P/uLUlTSLESyF1eak1tl28vifIejCK0bxmvLnJJFyed9DDB7Ku+/x+nFgde31u2qCyq0fawHD9mBFt9Q8m+q86yhi4YFVjeuOQQesgRta62qpstidKpXw9gJtT9QLi/MS6aMYQyn882FKaF6uApFesgZti7122u6PvmuvNdN4OQI9iF96KoD7VLPdsOktbOWP1va7Gxx+2I2Gq2tyItvQft51AKG5Z/RTxMRbahcLbteKpkfyIB6Vu2PlL9iHxcSiyw=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4FEAB5928074944784F51CEF4163E587@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766b8068-4abe-46c7-7835-08d74c593b92
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 01:37:23.4818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tm5nz2hWuW4hRGdK0SczZds8J5BYo6tNZ3aHFpv6IKAPA2Pck7FQPAlKRvE3rVsSAGL5JlT9/9Sk1JDtZ5LWXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1375
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Wed, Oct 09, 2019 at 09:10:57AM +0800, Jiaxun Yang wrote:
> >> I found that there is a typo in the title, please change CFUCFG to
> >> CPUCFG, thanks.
> >>
> >> Huacai
> >
> >It's too late for that - the email you replied to was telling you that
> >the patches have already been applied to mips-next, and I'm not going
> >to
> >rewrite the mips-next branch for something so minor.
>
> Hi Paul,
>=20
> I think it is worthy to fix this by rewriting mips-next tree. As it
> haven't PR to upward next tree and this typo may lead to confusion in
> future when reviewing git log.

I disagree.

It's fairly common good practice to not rewrite history that has been
shared. Quoting Documentation/process/7.AdvancedTopics.rst:

> Excessive use of this capability can lead to other problems, though,
> beyond a simple obsession for the creation of the perfect project
> history.  Rewriting history will rewrite the changes contained in that
> history, turning a tested (hopefully) kernel tree into an untested
> one.  But, beyond that, developers cannot easily collaborate if they
> do not have a shared view of the project history; if you rewrite
> history which other developers have pulled into their repositories,
> you will make life much more difficult for those developers.  So a
> simple rule of thumb applies here: history which has been exported to
> others should generally be seen as immutable thereafter.
>=20
> So, once you push a set of changes to your publicly-available server,
> those changes should not be rewritten.  Git will attempt to enforce
> this rule if you try to push changes which do not result in a
> fast-forward merge (i.e. changes which do not share the same history).
> It is possible to override this check, and there may be times when it
> is necessary to rewrite an exported tree.  Moving changesets between
> trees to avoid conflicts in linux-next is one example.  But such
> actions should be rare.  This is one of the reasons why development
> should be done in private branches (which can be rewritten if
> necessary) and only moved into public branches when it's in a
> reasonably advanced state.

Rewriting history can complicate things for developers working atop
mips-next (which is something I want to encourage, not make difficult)
and it would mean commit references such as those included in the
"applied to mips-next" emails I send out would become incorrect.

So when commts to mips-next are pushed to kernel.org, I generally won't
change them unless there's something majorly wrong. A single character
typo in a commit message doesn't count as majorly wrong, so no - I won't
be rewriting history to fix it.

Thanks,
    Paul
