Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B3068DA5C
	for <lists+linux-mips@lfdr.de>; Tue,  7 Feb 2023 15:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbjBGOSb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Feb 2023 09:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbjBGOSb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Feb 2023 09:18:31 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DE339B98
        for <linux-mips@vger.kernel.org>; Tue,  7 Feb 2023 06:18:23 -0800 (PST)
Received: from [IPV6:2001:861:4a40:8620:7b9f:2478:5d44:165f] (unknown [IPv6:2001:861:4a40:8620:7b9f:2478:5d44:165f])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FEBB660206A;
        Tue,  7 Feb 2023 14:18:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675779502;
        bh=KPSO8WzHlNF+W+tdi9PgWYpAK6OsrsSOcgvRdXxJUEw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=HXpd8lMz92l+tee50GPW8eraj1j0karWkzNjZgN72ggJJyitKoOQwnk2mez7bH1e2
         0Q90j0cTSkI0SDnYI3TNh1ecY33vJgDkUBbaCNvwxePCQc09xjczP2Uj/dN6FSI1nv
         57AdcfB6D3RcksU96c7uj5zA+Us5jAKnQADjcPgfTKv0UTp9FPhqOm7xDL3pPRWqeP
         Nhi1buEMQ5POoeX3FLGIOMGEMf3NDliggas6ccf/kN8YS9BDc/whtdExEqo77O+cHk
         MGWJ591nxPf4Hv1z8sNXygXGS1sOfiZdKbT9cXtwCz64C1jsvVF6rjO4AodaZFxC/q
         9fzGhXpHjqQJg==
Message-ID: <85031c0c-d981-031e-8a50-bc4fad2ddcd8@collabora.com>
Date:   Tue, 7 Feb 2023 15:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: tip/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22
 warnings (v6.2-rc7-273-gd67c17ddc899)
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     mingo@kernel.org, x86@kernel.org,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <63e1f7e0.170a0220.7142.de7c@mx.google.com>
 <Y+IRiiRtXvUzXOGp@gmail.com>
 <c3cd3489-ca32-bdf5-4538-d95532bf9430@collabora.com>
 <Y+JU07y+lvYAtZQT@sirena.org.uk>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <Y+JU07y+lvYAtZQT@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+Thomas Bogendoerfer +linux-mips

On 07/02/2023 14:40, Mark Brown wrote:
> On Tue, Feb 07, 2023 at 10:56:04AM +0100, Guillaume Tucker wrote:
>> On 07/02/2023 09:53, Ingo Molnar wrote:
> 
>>>>     4    cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
>>>
>>> ... but this exact same error was 'reported' a year ago on January 22:
>>>
>>>>    2    cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> 
>>> So these regression reports are useless in this form and they clutter 
>>> people's inboxes. Is any person reading them and acting on them to make 
>>> sure these emails are sensible?
> 
>> About the actual kernel build error, I guess it's a shame nobody
>> has fixed this yet.  I'll take a look what the root cause might
>> be.  If it's a KernelCI build configuration issue e.g. using
>> wrong compiler flags then we can fix that, otherwise it's
>> probably something to report more directly to some MIPS
>> maintainers.
> 
> Honestly at this point I think we should just drop the affected MIPS
> configurations at this point, as Ingo says they've been failing for
> so long with nobody caring.

Maybe the MIPS people just haven't seen this.  I've added Thomas
and the linux-mips list to confirm.

After some investigation, it turns out the error happens when
doing "make modules_install".  Here's the issue:

* modules_install is listed in "no-compiler-targets" in the
top-level Makefile

* as a result, scripts/Makefile.compiler is not included

* arch/mips/loongson64/Platform requires the "cc-option" function
  to add -mnon-loongson-mmi

* since "cc-option" is not defined when just doing "make
  modules_install", the flag is not added and the error mentioned
  above occurs

GitHub issue: https://github.com/kernelci/kernelci-project/issues/176

Here's a hack to prove this point, need-compiler is defined in
the top-level Makefile so it shouldn't be used here but
this "fixes" the problem:



diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 490dea07d4e0..024f62dbef76 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -317,10 +317,12 @@ KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_LDFLAGS         += -m $(ld-emul)
 
 ifdef CONFIG_MIPS
+ifdef need-compiler
 CHECKFLAGS += $(shell $(CC) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
        grep -E -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
        sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
 endif
+endif
 
 OBJCOPYFLAGS           += --remove-section=.reginfo
 


I guess another way would be to unconditionally add the options
to the cflags, in fact there are other places where this appears
to be done.  I'm not sure which GCC or Clang versions support it
or not, so that may not work in practice.



diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index 473404cae1c4..b7b2db13f1a2 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -12,7 +12,7 @@ endif
 
 # Some -march= flags enable MMI instructions, and GCC complains about that
 # support being enabled alongside -msoft-float. Thus explicitly disable MMI.
-cflags-y += $(call cc-option,-mno-loongson-mmi)
+cflags-y += -mno-loongson-mmi
 
 #
 # Loongson Machines' Support



This was reproduced using GCC 10 with the latest
kernelci/gcc-10:mips-kselftest-kernelci Docker image running as
root.


Is this something someone familiar with MIPS would like to fix
properly?  If not then please confirm that we should just drop
the loongson2k_defconfig builds from KernelCI.  Is this kernel
config actually still maintained in mainline?

Thanks,
Guillaume

