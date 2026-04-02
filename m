Return-Path: <linux-mips+bounces-14020-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA1gLxnlzmk5rQYAu9opvQ
	(envelope-from <linux-mips+bounces-14020-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 23:52:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A789B38E755
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 23:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D467301EF09
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 21:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B280E386427;
	Thu,  2 Apr 2026 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTB78iuK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39438237A;
	Thu,  2 Apr 2026 21:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166741; cv=none; b=jrV8Wi4AL68755IDZGL/yvQkqblhMeOnBa95fmp0I8w7p0a+uBoxSxj3J6eaoz4aFvMAKWADFJG7LiMFA8FQ10bL+nM+fnIZX/UBI/oHyJ4QKORoBCcrmrMw0TbDiEI/BOg37+sLVarolpZZYBD6zW5L5nS0hv6LyxQrIj04efY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166741; c=relaxed/simple;
	bh=v9zJEeNVmz7NcsMkpOPkdYk7q2EoPoCfcmjxBRbg/Gw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kST9lBUpPAwcUljsn4/TDzTuqhzA0G7DHv178sWvx+ViQBDLJO58/07ikIzQQjU7egA4SB5DqziBWqmHlR58m6mdSsrdMsMpnaSly7Ru75MvO01yTwSt7kca/3vGaN7p+nO3bbmHMeP/JdwSXwwPtl9wEgzczEUOXKquKdJzfnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTB78iuK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9D9C116C6;
	Thu,  2 Apr 2026 21:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775166740;
	bh=v9zJEeNVmz7NcsMkpOPkdYk7q2EoPoCfcmjxBRbg/Gw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PTB78iuKGtB1jnCLkrdAAEbFdUBu6bIVdFt5Wka6j9T73o4DOPCGZwiNrnq4PiEr6
	 mBFN0TFFR6noe6wbi63LOXrgXpdD106UW3pCqKSxrNzj8GxdtV8MQyp2Vy1SAsdp3d
	 M6xKXlZbCh0YABGR2JZ5uus7RZzPqgGZDTd9cRTDxhbH89DrUCD35i7ucql2BdpP2E
	 7ULjB46nbQkz0boFssqZvNz1786uWfD+aGTkjAGmooYiXv+ruQ7/oxb1SnuN7wMHKS
	 dZy72w3QSkA4WUNCLllLtT+k1bSnFq6cedLa+/KrtjYL9V2SlHZOhBUsWcX1NjRLrv
	 DcESm7m/FmPPA==
Date: Thu, 2 Apr 2026 15:52:15 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Mikko Rapeli <mikko.rapeli@linaro.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
    Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
    Andreas Kemnade <andreas@kemnade.info>, 
    Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
    Tony Lindgren <tony@atomide.com>, Huacai Chen <chenhuacai@kernel.org>, 
    WANG Xuerui <kernel@xen0n.name>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Clark Williams <clrkwllms@kernel.org>, 
    Steven Rostedt <rostedt@goodmis.org>, 
    Pablo Neira Ayuso <pablo@netfilter.org>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
    Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
    Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
    Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    Geert Uytterhoeven <geert+renesas@glider.be>, 
    Magnus Damm <magnus.damm@gmail.com>, 
    Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    =?ISO-8859-15?Q?Th=E9o_Lebrun?= <theo.lebrun@bootlin.com>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
    =?ISO-8859-15?Q?Jonathan_Neusch=E4fer?= <j.neuschaefer@gmx.net>, 
    Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
    Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
    Heiko Stuebner <heiko@sntech.de>, 
    Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
    Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
    Ard Biesheuvel <ardb@kernel.org>, 
    Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
    Bjorn Andersson <andersson@kernel.org>, Michael Walle <mwalle@kernel.org>, 
    Guenter Roeck <linux@roeck-us.net>, 
    Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
    "Rob Herring (Arm)" <robh@kernel.org>, 
    Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Anna Schumaker <anna.schumaker@oracle.com>, 
    Alexandre Gonzalo <alexandre.gonzalo@arm.com>, 
    linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-omap@vger.kernel.org, loongarch@lists.linux.dev, 
    linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
    linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
    linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org, 
    openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/9] configs: remove obsolete assignments to
 CONFIG_NFS_V4_1
In-Reply-To: <20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org>
Message-ID: <2a5bb9cf-3f0c-6069-6412-cd4c5c4e8b78@kernel.org>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org> <20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,armlinux.org.uk,iki.fi,kemnade.info,baylibre.com,atomide.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linutronix.de,goodmis.org,netfilter.org,samsung.com,nxp.com,pengutronix.de,mleia.com,timesys.com,arm.com,glider.be,mobileye.com,bootlin.com,HansenPartnership.com,gmx.de,gmx.net,zankel.net,suse.de,arndb.de,sntech.de,renesas.com,quicinc.com,roeck-us.net,oss.qualcomm.com,linuxfoundation.org,oracle.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-14020-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[98];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pjw@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A789B38E755
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026, Vincent Mailhol (Arm) wrote:

> CONFIG_NFS_V4_1 was revomed in commit 7537db24806f ("NFS: Merge
> CONFIG_NFS_V4_1 with CONFIG_NFS_V4"). However, some defconfigs are
> still referring the old configuration.
> 
> Clean-up all the leftover references to CONFIG_NFS_V4_1.
> 
> FYI, the suppressions were done using:
> 
>   git grep -z -l '^CONFIG_NFS_V4=' -- 'arch/*/configs/*defconfig' |\
>     xargs -0 sed -i -E '/^CONFIG_NFS_V4_1=/d'
> 
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN and CONFIG_NFS_V4_1_MIGRATION
> were not in scope of the renaming and still use V4_1 in their name, so
> keep those two untouched.
> 
> Fixes: 7537db24806f ("NFS: Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")
> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul

