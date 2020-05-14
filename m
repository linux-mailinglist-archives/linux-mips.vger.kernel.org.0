Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE021D3161
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 15:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgENNed (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 09:34:33 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21015 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgENNed (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 09:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589463273; x=1620999273;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-transfer-encoding;
  bh=8PX/L/naQftDsm+cBX69ACqTXRpTmFduJBFfTfnCbEE=;
  b=C9hE8LpMowxWM/OSoTLdXkGb/G0znJeZsxE+KBhqS1lA7fqseDMgedVC
   UONYckln/A2m9rhvuNDeAv25pLNifN7xiXXUi5WTS/YvSn3BEQwr+uQCl
   cFtHNqV6o0UsB4wYjI8fW7j9oFpgWFnVItnnyEsv9E7HsHGa9HLs1DDCe
   Pnm55j0X2otuaKgs5b3sTjYg8fkA5uQp7HL17Z2/fha5wqYo4AeGNJ6rv
   00/Am6fPhVkakTcB9iTNrXSbMeC2Dc9fh2dEJklr4REw30rjHr1Q3TyCf
   mZlg4jSogHkYYCVSNsrpo9GxplPJzgYC9VoQOsSJ8qJpwawOUl5/LkziD
   Q==;
IronPort-SDR: swCtBAYDjjCyyiUqg4mYkZSLQ0eObN975BJbFniIZu+olCbm32G7T6/8Q2eh04SdZ/klDr18cP
 UQqv3n+rPSpY1Its92krlFMTWOt8jgHsED/459C/lx7/B3+i6PpQ0R2V2f9U2OpeTVQIbxBmX2
 hifD8LMtyXKqP0QWcVT1lr0yyklabHo2D93jXkBJvkAUMoUKT8XUkxlnimdT2kW3MQNZpCowb8
 nZJZuTlI+6OP5fVmKICvya+4mo62kYB4TdnUgTDCHt2WKuc+DbKnD2aorLFhIoyLrVshyba5sv
 eWY=
X-IronPort-AV: E=Sophos;i="5.73,391,1583164800"; 
   d="scan'208";a="240388828"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 21:34:33 +0800
IronPort-SDR: UQqrcpAkSslpR8S1FwmY3S9XoKwk9p/bamfgOsV3dOP5nfLLVeItZvQIXbu99uDVzyy5qGFeRn
 q/3UJoABjlwppkA7FGE6R35IKkv/Sf4sE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 06:24:12 -0700
IronPort-SDR: dOQ+2MaR1eefUwGBgVuaBVDuKbxo6IuUfevUdMIWNzRnJriKNVZWhzBAYBLQItiXfufb6QRhTF
 P+f96057z1OA==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 06:34:29 -0700
Date:   Thu, 14 May 2020 14:34:26 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
cc:     Bibo Mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: update tlb even if pte entry has no change
In-Reply-To: <f165deac-1a71-dd88-dfe5-c1701f31567b@cogentembedded.com>
Message-ID: <alpine.LFD.2.21.2005141426160.6492@redsun52.ssa.fujisawa.hgst.com>
References: <1589422677-11455-1-git-send-email-maobibo@loongson.cn> <b46f4ac1-9738-6037-d60a-faebf2b4365c@cogentembedded.com> <f165deac-1a71-dd88-dfe5-c1701f31567b@cogentembedded.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 14 May 2020, Sergei Shtylyov wrote:

> >> If there are two threads reading the same memory and tlb miss happens,
> >> one thread fills pte entry, the other reads new pte value during page fault
> >> handling. PTE value may be updated before page faul, so the process need
> > 
> >     Fault.
> 
>     And "needs".
> 
> >> need update tlb still.
> 
>     Oh, and one "need" is enough. :-)

 Hmm, "the process need update" looks right to me (compare "the process 
need not update") as "need" is used as a modal verb in this sentence.  
Alternatively "the process needs to update" could be used (with "need" as 
a main verb, and "to" then).

 I'm not a native English speaker though, so I might be missing a usage 
subtlety here.

 NB I'd be in favour of capitalising "PTE" and "TLB" consistently 
throughout though as the norm is with acronyms.

  Maciej
