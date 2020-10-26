Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5195D298D89
	for <lists+linux-mips@lfdr.de>; Mon, 26 Oct 2020 14:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442892AbgJZNMc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 09:12:32 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:42943 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731134AbgJZNMX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Oct 2020 09:12:23 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 1C116772;
        Mon, 26 Oct 2020 09:12:22 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute1.internal (MEProxy); Mon, 26 Oct 2020 09:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm1; bh=jE/sdEfYYfl7ageh2OP4YHEXIU+y
        jGIFM8hj9fv1juU=; b=BslkchQbCSUTbY8LXI3nznM8fp+gv0tqDMW0V59wBk11
        7FhFp5LLlOf8VbYhBRqvPDAE8im8lQWgyamU/JaMcReqQ+ro7wdKERlkB74GbM4G
        jlKL3d8krkSNkta3zcYc70nn1On5LgJx1saA9rioNlvZ63ovf+2tblFLRsqDEkDs
        ge1+x4XJQtfJ/N3EIq3wR3WHgtl9PTaTT6Ej15cb2ZX5rArOWPuqtnuOf6jgdLvf
        Lrx3hax+i5meO5TSJePcDYZ8m43CJuSuWfjhjvOZZrIppmSMoAAQ70RwILFxjwVw
        odEGhdTU83wz7uIxwHfxBl0rCl/f6jYiJyV7UTrgJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jE/sdE
        fYYfl7ageh2OP4YHEXIU+yjGIFM8hj9fv1juU=; b=TXN289va9ks6UmPy79R3D/
        rz6doRLzy+uaHQ/1cIFjmrQ3CSdcoydxwwYhxsdH/Ke2zUWwSgSZo/rYEVEllQb7
        DlXXCka8JkzbqZdom3iqzoKsH5UniM0ImEO+wtoyT+ySRhINCYYHXENhdpkeB1sg
        bIXiQ5TL/KglU0/egxens/pf4dcxfnFQ2L/qOBnZm9MRdkhKdsF+NP09C+Bg8KD1
        BhJMm83Ad9I0ATA88foVOxrEVUxscOwhFIeGkR0U3kXDic2dSUUX5i/ZPMjCOom0
        +NC83/FRomJd6mi1KvUZryDddbBM0B291n2J4SIwVqar2WSnbQyHtjN4Gqz2Xd6Q
        ==
X-ME-Sender: <xms:NcuWXxMR5HbvmyWfi2u8X-0YuOVdYwKZSQOVSvkY_PUz25DMK7onKw>
    <xme:NcuWXz9z7AVi0W1tOzAETMhXiikwA_NqAWR-4clhom_sycXsrBSJ4VrigEeQsiUk2
    wDKjNUtegZa_bUVYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhohhhn
    ucfvhhhomhhsohhnfdcuoehgihhtsehjohhhnhhthhhomhhsohhnrdhfrghsthhmrghilh
    drtghomhdrrghuqeenucggtffrrghtthgvrhhnpeffuddufeefgeffgffhvdelveduieel
    leefgefffeegieelkeeifedtvdeuhefftdenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehgihhtsehjohhhnhhthhhomhhsohhnrdhfrghsthhm
    rghilhdrtghomhdrrghu
X-ME-Proxy: <xmx:NcuWXwQErMybUNcb4Z1kWitPjV0_cGOQy9wI5iInOgInXo5GodRCnQ>
    <xmx:NcuWX9u5bCGZI28Mx8zULFuKIHvTTpfK2txJX0QShBYIE6KbD3ZjgQ>
    <xmx:NcuWX5eobWZkStQCy6BYIYmJcAJ27pUbLzrB9C4VrPyy4PNe-I6k4g>
    <xmx:NcuWX5EFcdMfsHsxQi2OHzZp9UcZcgkxxl4rmJURCa5q-sS96pDN5g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3991E3C00A1; Mon, 26 Oct 2020 09:12:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <a5b08af5-ed9d-4adc-a311-35f962233f47@www.fastmail.com>
In-Reply-To: <20201026122926.1774569-1-gch981213@gmail.com>
References: <20201026122926.1774569-1-gch981213@gmail.com>
Date:   Mon, 26 Oct 2020 13:11:27 +0000
From:   "John Thomson" <git@johnthomson.fastmail.com.au>
To:     "Chuanhong Guo" <gch981213@gmail.com>, linux-mips@vger.kernel.org
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "open list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: zboot: put appended dtb into a section
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 26 Oct 2020, at 12:29, Chuanhong Guo wrote:
> This will make a separated section for dtb appear in ELF, and we can
> then use objcopy to patch a dtb into vmlinuz when RAW_APPENDED_DTB
> is set in kernel config.

Thank you Chuanhong Guo, this worked for me.

I have successfully network boot tested this change on ath79 hardware:
- kernel vmlinuz.bin
  then appended DTB, and packed into a uImage (out of kernel tree)
- kernel vmlinuz
  then updated ELF DTB appended_dtb section, and ELF booted

Cheers,
-- 
  John Thomson
