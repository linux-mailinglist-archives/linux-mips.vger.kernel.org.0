Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C310F17B160
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 23:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgCEWY3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 17:24:29 -0500
Received: from mail-qt1-f173.google.com ([209.85.160.173]:47087 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgCEWY2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Mar 2020 17:24:28 -0500
Received: by mail-qt1-f173.google.com with SMTP id x21so294959qto.13
        for <linux-mips@vger.kernel.org>; Thu, 05 Mar 2020 14:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZP+360y0FLp2APa2TNaALVYzFzDs8FXSBm0+DywyaH4=;
        b=HUrFN1dbO/z9kpoLqjTFcP7xrS4lBUv0oRT0OodfP/r9nX7+ph93vUDCDF1JY0tvq9
         URb72iOVpFp4OuTzYVCjBioS3RJRG+rAp8xeCAZ6Ass1J0ti0Ah4ioILaT8VHci8aszk
         Pcl88tf0aEA+BGLew4sDmODeFQo68psWoDpSeILRm6S7oP7lDSOn+XUfTVCbAWYXVRZZ
         6mDXiPtFvM3gcFNxHeBJ9rlXypFYxbmfUmM0LWoFw81/QVfEMayX/YiWRK7hd9nU191C
         Ik6D63i1S/nUVtjVyYzegZHT9TtDflI426FiQ5qtYjZQ7Lqq/44eLCTQCmPJlZ3dwK6r
         429Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ZP+360y0FLp2APa2TNaALVYzFzDs8FXSBm0+DywyaH4=;
        b=nQ/ox9hhM0QXt8t3t066wOcSuRFnWt4NQJsJxhJHJoU25OUjfoN+k83+R5mDyFG2om
         KDhgq0iKZ2QKcspsZ4EmJHLFiJitwDfHtt4yHIHWVUjz8k7scgilXzKuO8GlOn/I6IvP
         KrvhSZJmvBOZK42XEOyAUWBRT4boy/1YjLHwpMNIab0EAxFb6RL0Iw7H5o6rdZgrGOop
         F+6GeLCpvTPuyFDPr2Cv5Dfvaorg6cm2dNmz7UmxSI0lHQl2r6G/F3U8Jdw+D3ALAtQ8
         /9Hn+nYi0mwSXIwiU/3bp+ek6r955Tttdvo/wEvnmOEDH+OG7g/hpOi4VJFvN3ZF0j+F
         0cnQ==
X-Gm-Message-State: ANhLgQ1FwyYMEKyKGy1Va3yAVGrJC/TVkPPobxi7onxMw3Eklwi4fd4B
        aOEFlln+FXQwXnn+7Naziv1Nt7N4iwhIftO9ccfdJCaO
X-Google-Smtp-Source: ADFU+vtUslJSlx55iQgiopPZzqls2ZPEcIi5NbyKZPf/w4gudZBVqWUIXVLEBRewab4yCpqF4dv732NcdHDWMmpFWUQ=
X-Received: by 2002:ac8:1ca:: with SMTP id b10mr377593qtg.314.1583447067714;
 Thu, 05 Mar 2020 14:24:27 -0800 (PST)
MIME-Version: 1.0
From:   Patrick Doyle <wpdster@gmail.com>
Date:   Thu, 5 Mar 2020 17:25:54 -0500
Message-ID: <CAF_dkJCQuF0MaYddfqVRJ-8tNPWVkR8Q0ZYz22DUi9moAWsxeQ@mail.gmail.com>
Subject: Address space in MIPS Linux kernel
To:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,
I am attempting to track down a sporadic bug in a Wi-Fi driver used by
my (32 bit) MIPS 4.14.115 kernel.

With the help of a judicious printk, I happened to notice a call to
memmove (wrapped in a call to NdisMoveMemory()) that looked like this:

[   56.855917] rtmp_ee_bin_write16: NdisMoveMemory(c157cf37, 82d49cb0, 2)

I am curious about the two address spaces highlighted in that call.  I
seem to recall (from a book I read a decade or two ago) that MIPS
treats caching and memory management differently based on the upper
few bits of the 32 bit physical address.  But I have no idea how that
maps into Linux's virtual memory management.  Nor am I sure where or
whom to ask.  So, I thought I would start by asking here.

What does an address like 0xc157cf37 mean to the kernel?
What does an address like 0x82d49cb0 mean to the kernel?

I am a little surprised to see that the destination address is odd,
while the source address is even... I'll go investigate that as well.

Thanks for any pointers to any documentation anybody can give me.  Of
course, direct answers are also welcome :-)

--wpd
