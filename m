Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5268C324119
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 17:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbhBXPlL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 10:41:11 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59389 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236509AbhBXOTc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 09:19:32 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E14C55C0131;
        Wed, 24 Feb 2021 09:18:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 24 Feb 2021 09:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        to:from:subject:cc:message-id:date:mime-version:content-type
        :content-transfer-encoding; s=fm1; bh=jmM1IR0omSTIDl8vmfUE5tAUSg
        +1l5GnPhiWu43+Maw=; b=ejtHktRkB42iXqCUNIMaeTF969mqHK6+EaitU88wOy
        hdTfdxaAUaNhOjgzq8XpjP5ueNngQfbVOycrv4IUER8Gjj1XQD/08eQhplfobI+k
        3wc2UBT9Rp6sUTU6RB9V98q7ffivSQcSKVFSnbGvwPLfkquxAdcyu6wwNdfngQ58
        ra+YyQBvS/pV5cZQa8GyOwVLNPeU5IfE5iVAjNuWwCcaD8Ypyu7Q6qSuUT+vEhTO
        7fX/CiYsYkzoE4hV9wjEDLm3QZcWiO7KFG93axjJg8jSnk3HTlgJ+b71OOgwGCEo
        TfnulzaZuqCSCJQtR+/Pm5DV9n1z+NNaLRk8j3kJpwDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jmM1IR
        0omSTIDl8vmfUE5tAUSg+1l5GnPhiWu43+Maw=; b=WTXbUOx0ocTipyX1B29Ry1
        I4bNZpSb6Rj8HhxRZuy4jPIfALaMLnyzWGG4uiI144FhkI4QMYdskRXLZFPp1SP0
        sJG/jAKyJSUuvVVWszZsuLWQprIz0FyKnAnOq7PCqPpl6I3S9qPEnMds8udffley
        p6STofgIfuO8srOD5uYj4jrtTLQJZ8OTsrFLkpvd+K0J4UzPUPgpe7N6aujSg+ef
        shNzDrHIY93uw9s6gEBF/fBRHSeYwCHJI1VjAQ4V710aEaLM3DWGhjKaf79Wo4sO
        GS5hQA2bytVKs8Cv6zknu2EJFvrp5uFAQo7ANKdB/0QwHlp+fySwa1Dd5FsQrW2g
        ==
X-ME-Sender: <xms:OmA2YDrqdtETqeGpC-dby-_Jfsbj928Ncfl-ShATdM38O_6Ga0r_kA>
    <xme:OmA2YPpBrLuPsqkXMSGe8QapydevzBzTPkzkYcsrLTnafrauKM8gseavzdGZVJH6M
    bhR81O065GSVxp55j4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeejgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefvhffukffffgggtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihunhcu
    jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
    grthhtvghrnhepffdugefgieeggedvhfdvvdeileffhfdvfefhieegfeefhfeikeehudef
    keelffevnecukfhppeduleekrdejgedrhedurdeikeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhm
X-ME-Proxy: <xmx:OmA2YJk0jLIKuSKLB-_zBVdBSuIhr4o3y_tJ6XYdiem7mVW8l6jevQ>
    <xmx:OmA2YJHQJMlHfnQmalJMEUbq73Wk_VF4oiw59I35368J2yfkJJrawg>
    <xmx:OmA2YKoAZn3ncRDnBvu_AFWn-CN8ZNkSt1zZyOABWirSRBy8522MdA>
    <xmx:OmA2YJ2lr4OMqqC_dJgxUa0BfwNrw4wNah_pJJKfPTZF-E9dIWRNRQ>
Received: from [0.0.0.0] (li551-68.members.linode.com [198.74.51.68])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4BB52240057;
        Wed, 24 Feb 2021 09:18:30 -0500 (EST)
To:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        binutils@sourceware.org, gcc@gcc.gnu.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: HELP: MIPS PC Relative Addressing
Cc:     syq@debian.org, macro@orcam.me.uk, mfortune@gmail.com
Message-ID: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com>
Date:   Wed, 24 Feb 2021 22:18:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

I'm trying to implement PC Relative addressing for toolchain (GCC, LLVM).

MIPS Release6 had introduced pcrel instructions (e.g. auipc) that made
PC relative addressing for local data possible. It can help us reduce GOT
overhead and implement position independent kernel easier.

Just as RISC-V, MIPS R6 can load address by a pair of %pcrel_hi and 
%pcrel_lo
modifier. However, the usage is slightly different.

For RISC-V, %pcrel_lo shall point to the label of corresponding 
%pcrel_hi, like

.LA0:
     auipc    a0, %pcrel_hi(sym)
     addi      a0, a0, %pcrel_lo(.LA0)

However, for MIPS %pcrel_lo simply calculate LO16 of the symbol to current
PC, thus PC relative addressing will look like:

.LA0:
     auipc  a0, %pcrel_hi(sym)
.LA1:
     addi    a0, %pcrel_lo(sym + (.LA1 - .LA0))

I found it's very difficult for GCC to generate this kind of pcrel_lo 
expression,
RTX label_ref can't be lower into such LOW_SUM expression.

Could you please give me some hints about how to implement it?

If it looks infeasible for GCC side, another option would be adding 
RISC-V style
%pcrel_{hi,lo} modifier at assembler side. We can add another pair of 
modifier
like %pcrel_paired_{hi,lo} to implement the behavior. Would it be a good 
idea?

Thanks.

-Jiaxun

