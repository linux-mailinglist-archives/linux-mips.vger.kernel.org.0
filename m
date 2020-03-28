Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7052A19642D
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2020 08:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgC1Hc6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Mar 2020 03:32:58 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44271 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgC1Hc5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Mar 2020 03:32:57 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so4392377plr.11;
        Sat, 28 Mar 2020 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+lojOXOS3R1T9zdX8YSaUVNPC+Uk4217Q9UeUwGqUmA=;
        b=jl9qdfm3jYBUJpt5JTOg0fpX+frk2U8CDB7NHla700eqbFzeaU5ddRrnkF9ulMws0I
         c9g6XZd+U1YMZF9/3LdLKd5v8wOHCvTpOK+41v0dC3rQjbl2zkCOwiKzOqyresW/3Mhq
         BcOd0bkAnUi+Zs7kVOtOgih+P95QQehDeut+bVNmK8w/pAqzhJa2/sY/cLipp5Rtomn+
         y0jJ0Kfcg23Own5fnZnDcgXrP0oJy8MDqN1sdD4UE300VgF+beh9dCTKovy8+8QPgJF7
         tM2KC+Uqrh6IJRCMsJf7pzvSFnZ37F703JjyJuB4ywUQrA0N8cjQpQZ/4AufrBOA8und
         kRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+lojOXOS3R1T9zdX8YSaUVNPC+Uk4217Q9UeUwGqUmA=;
        b=LmvbnGAlNDuMYFNySrwUmk0uxaqmUv49/BwweWRxwmsT8ZPRAG+3SBgqVjXpZIFaqb
         HoBCm7B7pW0MdQonNxGrQoL5xT9jBz84pbfYKlvBBdJd89AA0le8liiLImr4JgNhBJQG
         q6WeX0myYrfzNeXV7HMFXf95wGk9iLdBiZHaTatg7CW0OcFpJxR+sKcuIfa5Un6aCA7L
         kekuX/G5QhZVbp+lO+wJtfssFfuM8ooCctubvzbZEYeDxg4+5N0euIBZK19lhcI0tUSF
         BQ0iFsArpkM4n4e9KCNsyC8i+87FBiwEbfsybkvJUU6p6gOUSFgRi/uhgkfRWtQmkOQF
         Wbuw==
X-Gm-Message-State: ANhLgQ0ug1tS/tTgyZaJLmvcBQnjaHH4qLyQqSklC4EJHgk8smQLVP5E
        N5HJ9L62TBH/HnF1l/raEe0=
X-Google-Smtp-Source: ADFU+vvZAKeuGMHdxTRxMDuAgPAhSOtHeclFmaO/lZBPjDGm3MtGtV8wn85/n9JVZFDDDkLW/Z1SiA==
X-Received: by 2002:a17:90b:4906:: with SMTP id kr6mr3699363pjb.13.1585380776339;
        Sat, 28 Mar 2020 00:32:56 -0700 (PDT)
Received: from localhost ([49.205.220.152])
        by smtp.gmail.com with ESMTPSA id 132sm5624219pfc.183.2020.03.28.00.32.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Mar 2020 00:32:55 -0700 (PDT)
Date:   Sat, 28 Mar 2020 13:02:53 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Brian Cain <bcain@codeaurora.org>
Cc:     'Thomas Gleixner' <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, x86@kernel.org,
        linux-sh@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org, linux-omap@vger.kernel.org,
        linux-alpha@vger.kernel.org
Subject: Re: [PATCH 0/6] Kill setup_irq()
Message-ID: <20200328073253.GA5250@afzalpc>
References: <20200321174303.GA7930@afzalpc>
 <cover.1585320721.git.afzal.mohd.ma@gmail.com>
 <059b01d604ab$637355b0$2a5a0110$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <059b01d604ab$637355b0$2a5a0110$@codeaurora.org>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Brian,

On Fri, Mar 27, 2020 at 09:48:38PM -0500, Brian Cain wrote:

> > Note 2: hexagon final image creation fails even w/o my patch

> 	What's the nature of the failure in "Note 2"?

drivers/base/firmware_loader/main.o: In function `fw_is_builtin_firmware':
/devel/src/kernel6/drivers/base/firmware_loader/main.c:132:(.text+0xc8): relocation truncated to fit: R_HEX_16_X against symbol `__start_builtin_fw' defined in .modinfo section in .tmp_vmlinux1
Makefile:1077: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

[ i had deleted the toolchain earlier, since you asked, download again &
checked ]

Regards
afzal
