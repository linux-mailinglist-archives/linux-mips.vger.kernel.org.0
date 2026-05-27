Return-Path: <linux-mips+bounces-14787-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FqDTGE2mFmqqoAcAu9opvQ
	(envelope-from <linux-mips+bounces-14787-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 10:07:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE835E0D74
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 10:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED2D5300A27D
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 08:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479193C76AD;
	Wed, 27 May 2026 08:07:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8E43C768A;
	Wed, 27 May 2026 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869254; cv=none; b=HiH6LJJLhXUOr9N6X+AHYkubcdHZUifKKZVy6R3IbzxafcTlFSojoMSLK1RxEMKQHyVEWAsqqhdnO75IVrMbZYXYqfBodOOOOAnEgoMY0FZ++kHqGIHxQ4MBnGJXXI5Y2SGKPrEB4NUu95rciqvyE5QuhPpk9KC+hqCSRTaOj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869254; c=relaxed/simple;
	bh=pak5sbhsS6mPmUU6KQyw21WdmKjFrJWE887gGqhrByE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfxTpEMQSTGLuV0bd2818ia0hla5Fr6AsfaKJYvv1flOWmhqbC52uY8E62uMsEkz+hX3pKk1FLQLBq3hP0HjiFFGnCvH5wJ+av4xhZ7SG37aJ92b+qgQzOgpmalPqdUye2wHsgAqSMZ8W8wYTVWLyIDRBgBb2XFeaDyrKnW9Nmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wS9IQ-0006aQ-00; Wed, 27 May 2026 10:07:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DBC08C0154; Wed, 27 May 2026 10:05:59 +0200 (CEST)
Date: Wed, 27 May 2026 10:05:59 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, brgl@kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: Re: [PATCH v3 0/6] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
Message-ID: <ahal58iuLAap2v6s@alpha.franken.de>
References: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14787-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.961];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5BE835E0D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 06:40:31PM +0200, Bartosz Golaszewski wrote:
> This series of patches updates board previously converted to use static
> device properties/software nodes to attach and use nodes attached to the
> respective gpiochip devices rather than simply defining unattached
> software nodes with matching name. This is a requirement of newer
> gpiolib code. Note that there is currently a workaround preserving the
> lookup based on the software node name, but it will be removed soon.
> 
> The additional 4 patches convert the remaining 2 boards to use software
> nodes as well and fix some build warnings.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v3:
> - Avoid compound literals as older MIPS gcc seems to struggle with them
> - Link to v2: https://patch.msgid.link/20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com
> 
> Changes in v2:
> - Add two patches fixing build warnings with missing prototypes
> - Use the new swnode field of struct platform_device_info
> - Link to v1: https://patch.msgid.link/20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com
> 
> ---
> Bartosz Golaszewski (2):
>       MIPS: alchemy: platform: add missing include
>       MIPS: alchemy: provide visible function prototypes to board files
> 
> Dmitry Torokhov (4):
>       MIPS: alchemy: mtx1: attach software nodes to GPIO chips
>       MIPS: alchemy: db1000: use nodes attached to GPIO chips in properties
>       MIPS: alchemy: gpr: switch to static device properties
>       MIPS: alchemy: db1300: switch to static device properties
> 
>  arch/mips/alchemy/board-gpr.c                   | 127 ++++++++------
>  arch/mips/alchemy/board-mtx1.c                  |  34 ++--
>  arch/mips/alchemy/common/gpiolib.c              |  45 ++++-
>  arch/mips/alchemy/devboards/db1000.c            |  31 ++--
>  arch/mips/alchemy/devboards/db1200.c            |   1 +
>  arch/mips/alchemy/devboards/db1300.c            | 219 ++++++++++++++++--------
>  arch/mips/alchemy/devboards/db1550.c            |   2 +
>  arch/mips/alchemy/devboards/db1xxx.c            |  11 +-
>  arch/mips/alchemy/devboards/db1xxx.h            |  18 ++
>  arch/mips/alchemy/devboards/platform.c          |   2 +
>  arch/mips/include/asm/mach-au1x00/gpio-au1000.h |   5 +
>  arch/mips/include/asm/mach-au1x00/gpio-au1300.h |   3 +
>  12 files changed, 322 insertions(+), 176 deletions(-)
> ---
> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
> change-id: 20260505-gpio-swnode-alchemy-3bff9c11e54c

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

