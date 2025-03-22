Return-Path: <linux-mips+bounces-8311-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 394B7A6CCA5
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 22:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC505170CEA
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 21:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A60B1DE2DC;
	Sat, 22 Mar 2025 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="V74/2Mjw";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Cn7wigqW";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="i2dRR+8j"
X-Original-To: linux-mips@vger.kernel.org
Received: from e2i673.smtp2go.com (e2i673.smtp2go.com [103.2.142.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082F2522A
	for <linux-mips@vger.kernel.org>; Sat, 22 Mar 2025 21:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742678834; cv=none; b=tHY8YNbrw15cW+6CQhon3lBwf77y4YqsAoG1fmvI4abuPycG7Tlw45/KuDK0GzasiGoQmmUrM3CaD0R63bgvGUxO8cMliekpRZTPGHiPVuXNvd1Z51AleJL0uk0Fd5cC+IoV6GVm4coV/cigtR3FR/vmFosJ8Efvu1WlvlUixHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742678834; c=relaxed/simple;
	bh=Mb79DNtCDH+YprnnK7anYxnTAMJUcCMlahmLdHiruXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a82IyBZyZAra8j13/Tn67t+cIUHXS+NNYBqSgBAoQGrOKgvEjXjsK08A0IT+ao7VoLSXjsZxhmnAT87j1sa3audRHNEmufxZ0W4fDZ0LksD9zzTOKmXzvZvB+9F+81MeCtnIxxw6fSNu6yah7/mauMMVUOezHw3BOCp5U1Nad+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=V74/2Mjw reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Cn7wigqW; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=i2dRR+8j; arc=none smtp.client-ip=103.2.142.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1742679720; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=ZkOds2VlnsYuYQLmdf8w6Ep7Uph1rKBP3ZEzdDiDdsg=; b=V74/2Mjw/5f+yYkVA8UNy94dLQ
	SGxHsUr9pmrybXU3ba1b03ywBXPHWLOW7TITTS3b2KAHv+kA4UFp76RfCqQbo1Pxj/J63cuaYXzjE
	7eZd9VRKWhlSqhvAVNvR/igam7eEn6hpYeVXxBKVpEzCGHRUaGuP22QYSHQ3nvddobOS4kskWlsEO
	PnC7+/ywE/KHjpXRuXMRzbes2DHmL1zWMITGk/oP7YIug9a8S4qOAm2NX1Z+QzkP9zqx2RY1Pu28y
	MjRQXKQjFjKWn3JopcHlFYgHQgNbRG9SBZ9Diqr2m1Bm9bIA+022/mmBLbP8N712dQJLVS3EEqi1o
	JHaLHl4g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1742678820; h=from : subject :
 to : message-id : date;
 bh=ZkOds2VlnsYuYQLmdf8w6Ep7Uph1rKBP3ZEzdDiDdsg=;
 b=Cn7wigqWWfrkfB4E7TBs+uA029v5EDYNaqGOH9ixT71u2E9bKZ1a4XnNQ81SnHRm7brYx
 rv2QtQsRBHANvEZmcgo6NfwubJfgQfx58O6l0uFDaoOZwUfBpF74DIlpmMfGtkknDOLv+xs
 JgZDMWWNNPrz4Pt0TU7TTdkbHa9kOaqJzsUsWcNOJHZqvKAVpj/lIJsg4YBX+1uNFZACjdx
 NWPS0sJjhHKdO3yvM4cUEDJLGFZN/IlJHsSoMDeGIBOgLZ05JCDlNgcdC9J/3J1rzuP+4GF
 7vSo/MmR8eOUKhT4JSoLhjP+j7sHRJM+sf6MSLH+T+KFDJOrsJUCTmEhaoWQ==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1tw6MF-qt4Caj-2k; Sat, 22 Mar 2025 21:26:20 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1tw6ME-4o5NDgrqv8S-km5i; Sat, 22 Mar 2025 21:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1742678776; bh=Mb79DNtCDH+YprnnK7anYxnTAMJUcCMlahmLdHiruXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i2dRR+8j6qpe7Lr05Ew/b/2waRuShb9V6VCoVHZHZQzdHQa0Vu6l0QnxuHdPs9pTD
 K32Ymx+ZJJZw3kdfQ310kflq/waV3fcLieVrlLXL2kUckhY7IIU75tlWkuxp3bFtfe
 VKWIFWQcF0HrGMa2a9FiDxgKOe9LZ9D4mTEZbRQM=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 65D913CBC9; Sat, 22 Mar 2025 22:26:16 +0100 (CET)
Date: Sat, 22 Mar 2025 22:26:16 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Khem Raj <raj.khem@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] mips: Add '-std=gnu11' to vdso CFLAGS
Message-ID: <Z98q-CurZoru9Qr3@fjasle.eu>
References: <20250322000940.778730-1-raj.khem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322000940.778730-1-raj.khem@gmail.com>
X-Smtpcorp-Track: 0KQC1dBSu6vC.kmhvMoNR5yf9.UFXtkQZ2Tq5
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286smZycWegRd
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Fri, Mar 21, 2025 at 05:09:40PM -0700 Khem Raj wrote:
> GCC 15 changed the default C standard dialect from gnu17 to gnu23,
> which should not have impacted the kernel because it explicitly requests
> the gnu11 standard in the main Makefile. However, mips/vdso code uses
> its own CFLAGS without a '-std=' value, which break with this dialect
> change because of the kernel's own definitions of bool, false, and true
> conflicting with the C23 reserved keywords.
> 
>   include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enumeration constant
>      11 |         false   = 0,
>         |         ^~~~~
>   include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=c23' onwards
>   include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typedef'
>      35 | typedef _Bool                   bool;
>         |                                 ^~~~
>   include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=c23' onwards
> 
> Add '-std=gnu11' to the decompressor and purgatory CFLAGS to eliminate
> these errors and make the C standard version of these areas match the
> rest of the kernel.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/mips/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index b289b2c1b294..15521004c563 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -30,7 +30,7 @@ cflags-vdso := $(ccflags-vdso) \
>  	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
>  	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
>  	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
> -	$(call cc-option, -fno-asynchronous-unwind-tables)
> +	$(call cc-option, -fno-asynchronous-unwind-tables) -std=gnu11
>  aflags-vdso := $(ccflags-vdso) \
>  	-D__ASSEMBLY__ -Wa,-gdwarf-2
>  

Thanks for the patch.  Did you evaluate adding a line like

    $(filter -std=%,$(KBUILD_CFLAGS)) \

to the assignment of ccflags-vdso?  Then MIPS VDSO C standard keeps aligned
with top-level.

Nevertheless,
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


