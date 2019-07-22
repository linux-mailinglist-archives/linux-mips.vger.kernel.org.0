Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8CF70BF2
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730805AbfGVVsN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:48:13 -0400
Received: from mail-eopbgr720114.outbound.protection.outlook.com ([40.107.72.114]:6072
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731302AbfGVVsN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:48:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=andbjAkycuIAq+jVLf3aCclsAbk7WVwQjCcVaiuDP/HsEoiKx0/Bbq/iaRHONuJrDk2Q5v4OvcdIdY+mAl3AmR87tcVv4ASvck876xSTgmR9TD1GRFvH+HCWK3ZT7/gFaZW69AFvp7yBmzEpUiQoYYDz2x71OQ4eDvRKdOQbfI8vIAO6qOFjTAp/2V+BRG/neYsMAW9R7/Dirrdxq05cn5TrDqk+l95S5UGG/9a+UVs3MkcHGHuf5om0rw/wAOPc9KVbH8wAJjK4p4ozXESvK5eXk/cGe1ar+nXVlUijdAeIE9dLXYqjX6r5dfL8cElP9cZDOyElIWgXTRGjYxLvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqBjQrpDj0OJH8VKBImffIK2WtKZNDhu+QZ0zckAMDA=;
 b=foOq2wsemfDZqvZZzniKrRIqCPqvCdm32SbWGVsIMhXGboYkR072Z4ziK5AVEmah8GA65fw8LpzM++KCGJPxhuGg38QOMG/RkipcK5jDXDgcRRt6t1ndsl0lWKkeRIADcv3P/7vbE4Sbyy3+iFbnrRhk9oeWgCrJQgHD4Cy8rT6b3boCQXFNw1x+feo/iJhsyofnvJR4RkP9hgR3bYwzz0Z6Zr/5+Dd5AJgQGy0Q2nLqiMLEU7FMrf7JbEUToKrI+4wnnpxAVJpr+iJxqGhfSAKLZZq+nI+6S3MxiN3KOVfkaeouwZfk4NyE7SZs1+njrKp0TSXT7HJ8pcHHCyBGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqBjQrpDj0OJH8VKBImffIK2WtKZNDhu+QZ0zckAMDA=;
 b=n1JrOcpanq9drJqqKfsJSMbu6RdUsaoMd/1M+WqSd56uURdmU9Wn8YGyZwTE5Hkc9zC/743UenmspllAeUFeXzINpmXYCF49ZAxVQdl7+HLCB2MKYP55jZA2LAXXfXiRne9LPlDL8zJ4EaNt/JmLf0UHOIR3EDSYNn9FZYpGd4M=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1760.namprd22.prod.outlook.com (10.164.206.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Mon, 22 Jul 2019 21:47:25 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:47:25 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Steven Price <steven.price@arm.com>
CC:     "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        James Morse <james.morse@arm.com>,
        =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        "Liang, Kan" <kan.liang@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v9 04/21] mips: mm: Add p?d_leaf() definitions
Thread-Topic: [PATCH v9 04/21] mips: mm: Add p?d_leaf() definitions
Thread-Index: AQHVQKQWHhmeZU4KlE2qPPJZI7g5vqbXLM0A
Date:   Mon, 22 Jul 2019 21:47:24 +0000
Message-ID: <20190722214722.wdlj6a3der3r2oro@pburton-laptop>
References: <20190722154210.42799-1-steven.price@arm.com>
 <20190722154210.42799-5-steven.price@arm.com>
In-Reply-To: <20190722154210.42799-5-steven.price@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::14) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 924f2cf9-abad-44f0-9daa-08d70eee2e91
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR2201MB1760;
x-ms-traffictypediagnostic: MWHPR2201MB1760:
x-microsoft-antispam-prvs: <MWHPR2201MB1760DD96341A807B6A561F8EC1C40@MWHPR2201MB1760.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(136003)(376002)(396003)(346002)(39850400004)(199004)(189003)(256004)(81166006)(81156014)(186003)(478600001)(11346002)(44832011)(64756008)(102836004)(486006)(8936002)(42882007)(68736007)(25786009)(6116002)(66556008)(66476007)(66946007)(3846002)(66446008)(1076003)(446003)(71190400001)(476003)(386003)(99286004)(71200400001)(6486002)(6506007)(7736002)(229853002)(316002)(305945005)(9686003)(54906003)(58126008)(6436002)(53936002)(76176011)(6246003)(7416002)(6512007)(8676002)(2906002)(6916009)(26005)(5660300002)(66066001)(52116002)(33716001)(14454004)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1760;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lFHgvB4Ko+ICPs6Xu+lunbkR+AMez0bOGRh1cLmdoO8sc9nERXWg3+T4OLnNTogn9Hb5iNM8qFzfNT2ZleyE+pK/9sfYemk17y8dyG4HBZLR8KvtPfDOjFnBCmQhskRe1RwFdlUOVbyGMmOEqZoGThuHHDIQK0HUMdT4SYgSlOi9L980gYJ/xWC+aBDnGMaCtuIFb5IxNMtG9aR6ZxdjhJBOcruSrTOh+X18vzQsQYenaqiLmkFREPD1q2u/poq+cmSawqF4AevyqyZjy9zjCzrrkCwFlqYTYsIjyrRURug1PFxH9GeCZoJIRtFJVyFFsVyLHpeTkzIjI/Pw8W3oaWjwxQXedOKId/lQiHul+yhi1mV6yf0CaqGecJgUzz5cic9D7OG7YVdiPzZ5pWsUnciIRv0N2xkbImU4nPk7L0U=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DF7AB4FF039DED40B7A6B5AE3E6E451D@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924f2cf9-abad-44f0-9daa-08d70eee2e91
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:47:24.8429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1760
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Steven,

On Mon, Jul 22, 2019 at 04:41:53PM +0100, Steven Price wrote:
> walk_page_range() is going to be allowed to walk page tables other than
> those of user space. For this it needs to know when it has reached a
> 'leaf' entry in the page tables. This information is provided by the
> p?d_leaf() functions/macros.
>=20
> For mips, we only support large pages on 64 bit.

That ceases to be true with commit 35476311e529 ("MIPS: Add partial
32-bit huge page support") in mips-next, so I think it may be best to
move the definition to asm/pgtable.h so that both 32b & 64b kernels can
pick it up.

Thanks,
    Paul

> For 64 bit if _PAGE_HUGE is defined we can simply look for it. When not
> defined we can be confident that there are no leaf pages in existence
> and fall back on the generic implementation (added in a later patch)
> which returns 0.
>=20
> CC: Ralf Baechle <ralf@linux-mips.org>
> CC: Paul Burton <paul.burton@mips.com>
> CC: James Hogan <jhogan@kernel.org>
> CC: linux-mips@vger.kernel.org
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/mips/include/asm/pgtable-64.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/p=
gtable-64.h
> index 93a9dce31f25..2bdbf8652b5f 100644
> --- a/arch/mips/include/asm/pgtable-64.h
> +++ b/arch/mips/include/asm/pgtable-64.h
> @@ -273,6 +273,10 @@ static inline int pmd_present(pmd_t pmd)
>  	return pmd_val(pmd) !=3D (unsigned long) invalid_pte_table;
>  }
> =20
> +#ifdef _PAGE_HUGE
> +#define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) !=3D 0)
> +#endif
> +
>  static inline void pmd_clear(pmd_t *pmdp)
>  {
>  	pmd_val(*pmdp) =3D ((unsigned long) invalid_pte_table);
> @@ -297,6 +301,10 @@ static inline int pud_present(pud_t pud)
>  	return pud_val(pud) !=3D (unsigned long) invalid_pmd_table;
>  }
> =20
> +#ifdef _PAGE_HUGE
> +#define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) !=3D 0)
> +#endif
> +
>  static inline void pud_clear(pud_t *pudp)
>  {
>  	pud_val(*pudp) =3D ((unsigned long) invalid_pmd_table);
> --=20
> 2.20.1
>=20
