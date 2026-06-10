Return-Path: <linux-mips+bounces-15041-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bbGMHVOMKWraZAMAu9opvQ
	(envelope-from <linux-mips+bounces-15041-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 18:09:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C5B66B32C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 18:09:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=A1dV01Ov;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15041-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15041-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E547C3050DDF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 15:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D988F4779BF;
	Wed, 10 Jun 2026 15:50:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453A43C063
	for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2026 15:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106615; cv=none; b=anOteCYBTXQJTI3V2tMAaW9Qd07FxvaPAWF8sSOSda6frqdNmgyhouRGNwmqN5u9Z5BgVfI2L5KDEKpt/+ScTb8H4msy+l1UJ72LVoYAgsVa0ERzgtr/Y+nAIULZCdWXxWZiKWR/Kam8Rir5KHVnUlLrLFJUMD6mFDG3LaPwL5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106615; c=relaxed/simple;
	bh=Uy1jEB3de+y/OfX3XHuNkFbcXv0lUt9DsP84+jWEy24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpeM89AyexZ+NZm0w31lCftDrVI7zciMX39BNeHEGMWyWv7+nMWziruNHz3sluLH8a2TtZvtXYfTzEFU6KJP9t8ERNODroQ2fogi76D2Vi8ZbkxTgQ4aOZc+hiYTV/FL0tsVDI8slFwwtNxgM4r3rJ5sCRU7DgkuGye33V8hh1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A1dV01Ov; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c132ac5ec2so68697685ad.1
        for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2026 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781106613; x=1781711413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N62HLkzXr48klLfiaIQLz719iwqu6H5OvWl+Uf/YYek=;
        b=A1dV01OvXQXtNo8CxM7FlcRA15o3kDdFauiOlq/K7Jbo1CPLHuGv9XLx6XY9b5VHcp
         06B44qE9eUsouvWDveW0Ov0gRPCJjC2V5l+HPGk8MQonRkx4oguTVrbei1McOH10S7P/
         J2LDaOvk4RQXd06ja1P0Nq7Y9M7gxFGSRlj7rIoc6G0wZhfFce0COX0MvMEzpQgZ8c+o
         btQVGqUqIuxkp2Hkp68j15hGIjrDWWFny1IcmegC7L/HclR/I91nxK4WO9UPaDWVmZqH
         Ip76RJFSYJ+ZI8SfwAgtNQIVbxvKk13ym5JCIjm/jBzFPt3beqDTEHNjpM48dM77H+oB
         Dbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781106613; x=1781711413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N62HLkzXr48klLfiaIQLz719iwqu6H5OvWl+Uf/YYek=;
        b=KMG8qWUHkeuxkz1DBD0OJ4Z1CurTcAO8njTt4AEoK4T1B0/qVUweUjUtaGeYmGeZYx
         dP0xBpLqrfuq1CZo28Ispq4ZfFmfVoIqC7Tw7p97EsyEWfWoCHS5zWI6SaQdF0pWeQ+L
         J/nsXuAe2ESCB4bv7rP/IOVTMhbuC9pRxCLtX+RA8a9tguTifq7AmG1W5ASyMq7FiZMM
         M2tLQFUq/CXYnvBA9oitIqto26M2/k2ofhaeUnNJBQOcBW46+P+vugnGToJMjnY4tGm1
         kUACEEaFkeXa9aR8OgZhFWfg31Df7U6x4iyfv1kIjqGln+rplZr2ftnpBiZesHUzDjjM
         wSjw==
X-Forwarded-Encrypted: i=1; AFNElJ94FmE9INtydOAYcOqKKQmzEyKt4P7+iAdZG1ewoIgZ/DVptT3Gzx3lvi5A6rHQZsy8uQ4im5gjBPjQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwBW/bfvsA2Q8XFq3PT/5um4TJSh8JgM4L7GJAGR7tDe02+ZwYb
	S1yN7Gl5S9Ipf6AMH5sovQMFhU7mHDpfFaVR/QgXJGcfwfGJ5CFZFvvJB2rvqmxLpw==
X-Gm-Gg: Acq92OHRJKZj1fgPzIXVOuhKuLA9yYZjWcEL5e5WSKPI4Ny9mkTo0kDytqwjWvzvKc5
	q+hhkQ5kkVAwEQMyt55TitJbDk3gMhdC6QUk9EEa8T6WZTLfKX9NndTpSOCyHDU8SuH2dOLTPdU
	KwkyEY255Ov8H/v1hZ3cuYWoNneeYEgxmSKIik1ZxnEHlLl433K9xAUv9H4nrA6Rt2M24lBkyeJ
	4uOMBD0B6P8PCHUaQeyToRbIc/5+MPU3MTSlFfXRCFMi02DIlqYa3rX4etoWWiiTaN5cuc9aS87
	aY/o54hI/CkT8r5TS33RnNGFqWAkmowMQZKDO4U9cGU1C/KukDOy4ZemHGroj6eCfRbwdjasGyR
	7/E6QwTX8eIhz/wiyObGdfJFyuULpO4FjjmFWdljqLtrPVwFw8jSeFbM7nPuUqqhfCI0vxawLcM
	sEFP98uU//Xz10dzxdp44fXshArEPY9rB54fdXoxKM/heHGU5YVLJfypBuywuThD9CwZ8BYRfZ9
	izjaoowcrhgK8Sp
X-Received: by 2002:a17:902:fc4c:b0:2c2:1982:527a with SMTP id d9443c01a7336-2c2198254f0mr234468445ad.16.1781106612163;
        Wed, 10 Jun 2026 08:50:12 -0700 (PDT)
Received: from google.com (112.173.50.34.bc.googleusercontent.com. [34.50.173.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm56793545ad.61.2026.06.10.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:50:11 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:50:07 +0000
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: [PATCH] MIPS: VDSO: Avoid including .got in dynamic segment
Message-ID: <aimHmmG48fpqtcJO@google.com>
References: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,alpha.franken.de,google.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-15041-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:morbo@google.com,m:justinstitt@google.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:nick.desaulniers+lkml@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ndesaulniers@google.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ndesaulniers@google.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34C5B66B32C

On Tue, Jun 09, 2026 at 06:31:21PM -0700, Nathan Chancellor wrote:
> After commit 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
> MIPS_GENERIC_GETTIMEOFDAY"), building ARCH=mips allnoconfig with LLVM=1
> shows some warnings from llvm-readelf while checking the VDSO for
> dynamic relocations:
> 
>   llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': invalid PT_DYNAMIC size (0xa4)
>   llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': PT_DYNAMIC dynamic table is invalid: SHT_DYNAMIC will be used
> 
> The blamed commit alters the link order of objects into vdso.so.raw,
> placing vgettimeofday.o after sigreturn.o. This ultimately results in
> the .text section shrinking slightly in size, which in turn changes the
> offset of the .dynamic section.
> 
>   -  [ 9] .text             PROGBITS        000002f0 0002f0 000930 00  AX  0   0 16
>   -  [10] .dynamic          DYNAMIC         00000c20 000c20 000090 08   A  5   0  4
>   +  [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
>   +  [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
> 
> Changing the offset of the .dynamic section causes the dynamic segment
> size to grow by the same amount, which triggers a warning in
> llvm-readelf because PT_DYNAMIC's p_filesz (0xa4) is no longer a
> multiple of its sh_entsize (8):
> 
>   -  DYNAMIC        0x000c20 0x00000c20 0x00000c20 0x00098 0x00098 R   0x10
>   +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
> 
> The size of the dynamic segment was already incorrect before the blamed
> comment, as it should be 0x90 like the .dynamic section above (18
> entries at 8 bytes per entry); it just so happens that 0x98 % 8 is 0,
> whereas 0xa4 % 8 is 4, so there was no warning.
> 
> Looking at the section to segment mapping of the dynamic segment reveals
> that it includes the .got section, as it is implicitly placed after
> .dynamic by ld.lld's orphan section heuristics and inherits its segments
> from the linker script.
> 
>   [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
>   [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
>   [11] .got              PROGBITS        00000cb0 000cb0 000008 00 WAp  0   0 16
> 
>   Section to Segment mapping:
>    Segment Sections...
>     00     .mips_abiflags
>     01     .reginfo
>     02     .mips_abiflags .reginfo .hash .dynsym .dynstr .gnu.version .gnu.version_d .note .text .dynamic .got
>     03     .dynamic .got
>     04     .note
> 
> Explicitly describe the .got section in the MIPS VDSO linker script
> after .rodata, which switches back to the default text segment,
> resulting in a dynamic segment that is the exact size of the .dynamic
> section as expected with no other layout changes.
> 
>   -  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
>   +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x00090 0x00090 R   0x4
> 
>   -   03     .dynamic .got
>   +   03     .dynamic
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2166
> Fixes: 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> The fixes tag feels a little strong since it seems like it has just been
> luck up until this point that there has been no warning but I decided to
> be conservative and include it regardless. Feel free to remove it if you
> see fit.
> 
> I think this should go via timers/vdso with the blamed commit. I plan to
> send a follow up series for 7.3 to add '--orphan-handling' to the MIPS
> VDSO to avoid issues like this in the future but that can go via the
> MIPS tree, as it is not really a fix and I will need to properly test
> it.
> ---
>  arch/mips/vdso/vdso.lds.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> index 05badf3ae0ff..278ab6444e98 100644
> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
> @@ -56,6 +56,7 @@ SECTIONS
>  	.dynamic	: { *(.dynamic) }		:text :dynamic
>  
>  	.rodata		: { *(.rodata*) }		:text
> +	.got		: { *(.got) }
>  
>  	_end = .;
>  	PROVIDE(end = .);
> 
> ---
> base-commit: 13f6218e6fe79dc64aed76d738b765b45f62492b
> change-id: 20260608-mips-vdso-fix-section-layout-262bc18d0c29
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 

