Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DEC1D3704
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 18:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgENQxl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 12:53:41 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:41983 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgENQxl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 12:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589475220; x=1621011220;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KFgmUwUlcx3bfWWqOKecVwtAnB9eGpMC0/Do+w0CFV0=;
  b=mbNoy3p2h4NNz0somLyJ+d5xnRqULdx/QbqjluT3rDS/vF2f1rDn6OeD
   BzBgbzofUnVK7zbZp+7LXcSe0PwkPL//OiX72pd6/GbHGEeHU1iQ31x2K
   U//WvAGMeD4GohQKSyBU1nIt//A32CF1pwb+2Ubwa/NUINZkjJouT8iaM
   j5XjmWx+gbLStxorBM4Q5SbBGXlgWGiM6BU1Ko5/sJsspPX+EyD8/CqYB
   7TeHePrgLzgi3tczX0IWjwsKaCqKUoCopqgYxYhcqMBDUxZdM9e/y7em+
   DlpVukrCKUT64TDMzUy+bKSW0WiI3gD0uSV/JBPGDaIq22g584rEE0Vsv
   g==;
IronPort-SDR: wVzlO5GffB/SHQkuIrc200FWsEl7dn+NLOwvxTwC+OueEf5GrYLXvcmpTfS0Lf7bzSOYloConA
 nAfjrIRFf3LeYoaHbMotoe3fZlADaqZ1lI19la3sAyw5+UKASq9kTsc7NFfDND7C+Y5F3wwmF1
 bu0VBLjRTLKn+dg9tJ4A+65B/dxEGkBtho9b5uM3kB5/bA39qBsjv2m7CRWQO9X6zpHpbaUH+d
 nD7VjhD6zkdDISR4Ydwpw547NFSdqwDBRiyH2DYpc2PA5sUmKL0ICwIzw3l42WZs8pmT3Wzf+i
 zOA=
X-IronPort-AV: E=Sophos;i="5.73,392,1583164800"; 
   d="scan'208";a="137696470"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 15 May 2020 00:53:40 +0800
IronPort-SDR: nc35H0jhLZOSZ2s3LkhAze1al6Rifo+NOyXrn7pgUOr/un43gHyTzNBY/DzyoqtVLkzQtIERmo
 s2opfGTCDgZolBGlNlkWWwOfhfL5E0YMo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 09:43:19 -0700
IronPort-SDR: xKD4DtZSw/7NTUKy7BYldhhOU+OkkXXNVU85xZSdLBTnnmtGJNscx1cY+BD3g2GHuYJscoiyqe
 11CFvbLCDu7A==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 09:53:39 -0700
Date:   Thu, 14 May 2020 17:53:36 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Alexander Potapenko <glider@google.com>
cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>, dima@golovin.in,
        linux-mips@vger.kernel.org
Subject: Re: Inline asm arg size mismatch in csum_tcpudp_nofold() on MIPS
In-Reply-To: <CAG_fn=W0JHf8QyUX==+rQMp8PoULHrsQCa9Htffws31ga8k-iw@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2005141737200.6492@redsun52.ssa.fujisawa.hgst.com>
References: <CAG_fn=W0JHf8QyUX==+rQMp8PoULHrsQCa9Htffws31ga8k-iw@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 14 May 2020, Alexander Potapenko wrote:

> Hi Daniel, Maciej, Toma,

 ImgTec is no more and I have no idea where Daniel or Toma have gone.

> When trying to build a MIPS kernel with Clang we are hitting the
> following compiler error:
> 
> ./arch/mips/include/asm/checksum.h:195:9: error: unsupported inline
> asm: input with type 'unsigned long' matching output with type
> '__wsum' (aka 'unsigned int')
>         : "0" ((__force unsigned long)daddr),
> 
> This can be reproduced with the attached config and the following make flags:
> 
> make ARCH=mips CROSS_COMPILE=mips64el-linux-gnuabi64- CFLAGS="
> -mabi=64 -EL --target=mips64el-linux-gnuabi64 -w" CC=clang LD=ld.lld
> -j64
> 
> (see also https://github.com/ClangBuiltLinux/linux/issues/836)
> 
> Looks like a similar bug has been previously fixed here:
> https://www.linux-mips.org/archives/linux-mips/2015-02/msg00185.html,
> but I couldn't come up with a proper fix.
> Do you know if there's an easy way to work around this error?

 It looks like a problem with the compiler as there is nothing wrong with 
the `asm'.  The syntax tells the compiler that operand #0 and operand #1 
are both held in the same register and that the type of data held on input 
is `unsigned long' while the type of data held on output is `unsigned int' 
(i.e. the `asm' truncates it as a side effect; of the DSRA32 instruction 
actually).

 I guess you could stop telling the compiler about the truncation already 
made, by assigning operand #0 to a temporary variable of the `unsigned 
long' type, which would then be truncated again with the `return' 
statement, but that would of course cause a pessimisation in this 
performance-critical code.

 So I think the way to move forward is to make this workaround conditional 
on Clang being used, and if you care about that compiler, to file a Clang 
`asm' handling bug too (as it seems to have no way to express `asm' 
sequences that force an input and an output into the same register, 
typically due to a machine code constraint, and imply a cast on the data 
type handled both at a time).

  Maciej
