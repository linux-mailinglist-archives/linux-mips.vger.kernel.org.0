Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786743ADDF4
	for <lists+linux-mips@lfdr.de>; Sun, 20 Jun 2021 12:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbhFTKYq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Jun 2021 06:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhFTKYp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Jun 2021 06:24:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3ADC061574
        for <linux-mips@vger.kernel.org>; Sun, 20 Jun 2021 03:22:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i13so24816409lfc.7
        for <linux-mips@vger.kernel.org>; Sun, 20 Jun 2021 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XFaJM/Ok4x210R6KSzwKDf++HXDpbgNb8eBibT0zJbw=;
        b=TtzDZR201ErjP52bxanNhQxuIJaCll2fkvxBkyaAu8B05O0aHKBC6F+Iklu7FIacWc
         U6zozd8p9uYguIVGiKzzov2fhzljHrG+XH8egP5l3iZqPDgy2ErYuVAlR184hXF9Mgzx
         o6WTmZbfa92OvYRKo8lvW3I4wjWn5as4fybF26G623lttN0DmSQWztLFsWBD1W2gjGXW
         aIHsWC5RvxazXIyT1zeqKojQh77JCvBZkIQdnX5SYFtihQcM7bYASbr5AOHEYvVDdlId
         7BhlADb6evWhgJMiIMtmEpA/HOmju0MriKCzte2Kk32cGrjgud2ofHW0nyefrGPwp6ek
         Q5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XFaJM/Ok4x210R6KSzwKDf++HXDpbgNb8eBibT0zJbw=;
        b=nn5NQI7cjMW1LHORRQMkRGNm51sqDmM8TLLKR0oNLEFObl1WmNtRrYYn1MxTA0ytZq
         m4Ny/M/aOG8dfWRnUiimN3UrS7IJYT6429MfdUlQtFHzg+LNZT7G1CT+0k8qFmNm5ajg
         6yeq5WfijS2gnlYg4AcQ//I5G5i6D46bGIc1a/J6w12eh+6eW4S10YlmEpyA/Jcm+XKh
         ABijlyOWZnmylPQVZpnscnwnEb3/qdvIpTzMaybaHdUz7b5g2W4gRai1/9NdXYkOyG4H
         BKIPY5qRV9fw81CUbcHXWqVi/h8JLLlIfqxLPMsLDGZ2OliaufhKLN3acw9HcyaUoavp
         dlzA==
X-Gm-Message-State: AOAM533+yGqN9lmrspvayDzgYuAbIvRUCmAePTYdbFahx1Zq2mbnzXMK
        TrsPsDTqxB8MhrPx11DUEAQ=
X-Google-Smtp-Source: ABdhPJyP5uyH+XmtBcqvzzZLupxhxsfgHkSAo1JbLaE8iBEAsoCYnXpSnaIeucZnnhsIZHDu7cJ4dA==
X-Received: by 2002:ac2:5239:: with SMTP id i25mr9925502lfl.142.1624184548784;
        Sun, 20 Jun 2021 03:22:28 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id p5sm1871105ljc.117.2021.06.20.03.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 03:22:28 -0700 (PDT)
Date:   Sun, 20 Jun 2021 13:22:26 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Tony Ambardar <tony.ambardar@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: Help with SLT insn under MIPS R6
Message-ID: <20210620102226.4jtv3sjyfsh7zuyk@mobilestation>
References: <CAPGftE-dQhsjJAWK47SD6m5C30RBk1Pc=q9sWFM1pAKHmaFyeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPGftE-dQhsjJAWK47SD6m5C30RBk1Pc=q9sWFM1pAKHmaFyeg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tony,

Are you working on adding the MIPS32 EBPF JIT support? If so that
would have been super useful to have on MIPS arch!

On Wed, Jun 16, 2021 at 07:15:41PM -0700, Tony Ambardar wrote:
> Hello,
> 
> While working on a MIPS32 BPF JIT and testing under QEMU, I've
> encountered some problems related to the behaviour of the SLT[I][U]
> opcode under MIPS ISA R6, and would appreciate some help/insight
> clarifying various online and documented descriptions.

I can't say about the issue for sure but here are my thoughts regarding
it.

> 
> In "Introduction to the MIPS32 Architecture"
> (MD00082-2B-MIPS32INT-AFP-06.01), some wording states:
> "CPU truth values ... are replaced by Release 6 instructions that
> generate truth values of all zeroes or all ones (suitable for logical
> operations involving masks) and interpret all zeroes or any non-zero
> bit as true or false ..."
> 
> This change is also echoed elsewhere online:
>   - https://www.linuxsecrets.com/linux-mips-wiki/MIPS_Release_6.html#MIPS32.2F64_Release_6
>   - https://en.wikipedia.org/wiki/MIPS_architecture#MIPS32/MIPS64

First of all what I would rely on is the official document rather than an
on an a few words on wiki, which AFAICS were mentioned with no
particular context. So what we need to analyze is what
+ MD00082-2B-MIPS32INT-AFP-6.01 (MIPS® Architecture For Programmers
Volume I-A: Introduction to the MIPS32® Architecture) and
+ MD00086-2B-MIPS32BIS-AFP-6.06 (MIPS® Architecture for Programmers
Volume II-A: The MIPS32® Instruction Set Manual) say.
Here is what MD00082-2B-MIPS32INT-AFP-6.01 says:

"CPU truth values changed from single-bit to multi-bit: pre-Release 6
instructions that only looked at bit 0 of the register containing a
truth value are replaced by Release 6 instructions that generate truth
values of all zeroes or all ones (suitable for logical operations
involving masks) and interpret all zeroes or any non-zero bit as true
or false, which is compatible with programming languages such as C.
There are also related changes to branches and conditional move
instructions."

I think the part regarding the CPU truth values only concerns the
changes described in MD00082-2B-MIPS32INT-AFP-6.01: "5.5.3 Conditional
Move Instructions" and some new conditional branch instuctions
introduced in MIPSr6. So GPR-related MOVN/MOVZ (see
MD00086-2B-MIPS32BIS-AFP-6.06 and "Programming Notes" of these
instructions for details) have been replaced with GPR-related
SELNEZ/SELEQZ. The later ones are now compatible with not only dual
booleans logic (0 and 1 which MOVN/MOVZ produced), but with C-like
booleans interpretation (any non-zero value is true). That doesn't
imply the SLT{I,U,IU} semantic change, but merely that the
SELNEZ/SELEQZ instructions can correctly work with any result
generated by logical operations ({N}OR{I},AND{I},XOR{I}, etc) and data
loaded from external memory. Most likely the similar semantics related
to the C-compatible boolean perception has been implemented in R6
instructions BEQZC/BNEZC.

> 
> However, in "The MIPS32® Instruction Set Manual"
> (MD00086-2B-MIPS32BIS-AFP-6.06), the SLTU insn *is not* specified to
> generate all-ones truth values.

Right. AFAICS it doesn't need to. The way it generates the true value
is perfectly compatible with SELNEZ/SELEQZ and BEQZC/BNEZC.

> 
> Generating all-ones truth values for SLTU impacts things like
> carry-addition code written for MIPS32R6, such as in my BPF JIT
> R6-support code. Curiously, while testing this under QEMU I saw many
> test-case failures, and debugging seemed to show QEMU not generating
> all-ones truth values when emulating the R6 ISA.
> 
> Thus, the key questions:

> 1. What is the correct/expected output of SLT under the MIPS ISA R6?

In accordance with MD00086-2B-MIPS32BIS-AFP-6.06 SLT{I,U,IU} should
generate 1 as true value and 0 otherwise.

> 2. Does QEMU properly emulate SLT under ISA R6? If not, how do other
> developers reliably test for R6 compliance?

Alas I can't say much regarding QEMU. So @Paul, @Thomas, could you
join in the discussion and if possible Cc' someone MIPS-Qemu aware?

-Sergey

> 
> Thanks in advance for any help,
> Tony
