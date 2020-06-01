Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC731E9B95
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 04:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgFACM7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 May 2020 22:12:59 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:14221 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgFACM6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 31 May 2020 22:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590977613; x=1622513613;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=G9egf8ncqlmNo86Zk2ECTYlQmjE3EWTlChax8u0y5nc=;
  b=fNJukKl7eiGbhjvFPEkmcQgCb6droLXWJyf6gKh7bKubcDJEXhygGg8h
   h8cJz9o2eDW/2lWbOm8lr7JCj+2KINSuAeBYYSS04AIHWk9OxlGpqBSS0
   +maUipAuM0U6s5fOWUngdPxSKEO69zVzJLezZdLUrxmB2+EUv/E3THw2v
   EUeWnS8B6vO/G3bHYyzzkRbE5tWtDCPqViyWe53GRcc0DvibahF681ciT
   KTFHkFtQImJuhffa07EdM4hc8NWoCig5J7WMR4lXQbB4enBhpL4JLZ4Kw
   CsrdrBEyyFf+5JQNqh3BWBeCgZmdwuft1Bz4PAMHc4Wwhywm6DUWwpe3D
   Q==;
IronPort-SDR: M+J3AUIEp2aZfxFaLW7bUEdgSJHmPZq/QdpZrvhR8wEJyZOYBvvBcWbyjFHZXCx4DFUOaIbWvk
 JL7YFYblrrInf+WTBEps3+6mpqL1nXSWfIoM35ZV0nK8Ql+qE1KtlJGTIeBjHgBJmTQxNcQ/GE
 dTBiJBMnZnEZ+SSJQovupqe1n537Vffs9BixNAop4kVSOIUlQoMDSE3+yJ129jPa5mF1QlPoSO
 Cu2Xq7dqdzyPbL+nPbjJdLng9LiRMq4bxB698KFh7OWu0drFMY8xzoUnPd9MrAgGz8AwcQzGGP
 zCM=
X-IronPort-AV: E=Sophos;i="5.73,459,1583164800"; 
   d="scan'208";a="241758131"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Jun 2020 10:13:33 +0800
IronPort-SDR: xo60xNdqJ+wqbTYB4QO3H+m2pr6uop2pKMlKWxiZ9vwfLeTp4c2bLyO+PwEfhk4AXdtCgZ6ELv
 WrsrMNYXHYSL67vvdBTYmI+6xw04TnjT0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 19:02:07 -0700
IronPort-SDR: OYgVX96uwh6+yFZthpDJwHUx7k+aRupC/Ky1jWRI+sAKygEFp/AuSBA7qVotOqw2Nj/g3bVBKI
 ng7wdeHnnq+g==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 19:12:55 -0700
Date:   Mon, 1 Jun 2020 03:09:07 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Huacai Chen <chenhc@lemote.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        WANG Xuerui <git@xen0n.name>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH V2] MIPS: Tidy up CP0.Config6 bits definition
In-Reply-To: <1590220305-29176-1-git-send-email-chenhc@lemote.com>
Message-ID: <alpine.LFD.2.21.2006010253080.3271@redsun52.ssa.fujisawa.hgst.com>
References: <1590220305-29176-1-git-send-email-chenhc@lemote.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 23 May 2020, Huacai Chen wrote:

> CP0.Config6 is a Vendor-defined register whose bits definitions are
> different from one to another. Recently, Xuerui's Loongson-3 patch and
> Serge's P5600 patch make the definitions inconsistency and unclear.
> 
> To make life easy, this patch tidy the definition up:
> 1, Add a _MTI_ infix for proAptiv/P5600 feature bits;
> 2, Add a _LOONGSON_ infix for Loongson-3 feature bits;
> 3, Add bit6/bit7 definition for Loongson-3 which will be used later.

 What a mess!  We use *prefixes* for vendor- or processor-specific names, 
e.g.:

#define R3K_ENTRYLO_G		(_ULCAST_(1) << 8)
#define R4K_CONF_SW		(_ULCAST_(1) << 20)
#define MTI_CONF7_PTC		(_ULCAST_(1) << 19)

etc. and MIPS_ denotes a MIPS architectural (as in R1, R2, etc., i.e. not 
legacy) definition, e.g.:

#define MIPS_CONF_VI		(_ULCAST_(1) <<  3)

 So to be consistent these would have to be:

> +/* Config6 feature bits for proAptiv/P5600 */
> +
>  /* Jump register cache prediction disable */
> -#define MIPS_CONF6_JRCD		(_ULCAST_(1) << 0)
> +#define MIPS_CONF6_MTI_JRCD		(_ULCAST_(1) << 0)

#define MTI_CONF6_JRCD		(_ULCAST_(1) << 0)

etc.

> +/* Config6 feature bits for Loongson-3 */
> +
> +/* Loongson-3 internal timer bit */
> +#define MIPS_CONF6_LOONGSON_INTIMER	(_ULCAST_(1) << 6)

#define LOONGSON_CONF6_INTIMER	(_ULCAST_(1) << 6)

etc.

  Maciej
