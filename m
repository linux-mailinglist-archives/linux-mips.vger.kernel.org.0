Return-Path: <linux-mips+bounces-13930-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPkFAkPJw2lKuAQAu9opvQ
	(envelope-from <linux-mips+bounces-13930-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 12:38:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BCE32402C
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 12:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EED1130221FC
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 11:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8143CD8B8;
	Wed, 25 Mar 2026 11:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gek2NIF+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174F3AEF29;
	Wed, 25 Mar 2026 11:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438055; cv=none; b=C23U600qty4xUWJ/4lPG9N9gqp77x0XddSy9UBs3aO7AaDtogtNUDw0WkUWjvnbYCF2FNmCYBFDqak4+BMZsEL2ruen2RLK4BMR9wXki2iEuy0FPpvDmKVVgSn7wk88BSgJfi8PObf6ZgCpv7QbC8UQ6FXArHanHzWNYqA6xYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438055; c=relaxed/simple;
	bh=aD1JvDIfq0GE0tWPZnEpoteUQl9LKVoUeLp+4KiP+wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPbOX9Xm4rouURHDfzNbuXe8jUZbm0od46RrF8MMGw/151hP+mVAL2d8T98yf3SibIxxky4muJJnMoTUnD4vD2ixo+ChdIGHh/XHjFq9sCAbbJpulTGS7+s2CPiIrU5h2u4Un8hpo6MT355a10WUXCu8Fh9PYPXdvyEtf0mNekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gek2NIF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE08C4CEF7;
	Wed, 25 Mar 2026 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774438055;
	bh=aD1JvDIfq0GE0tWPZnEpoteUQl9LKVoUeLp+4KiP+wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gek2NIF+50ZmqIFXo3Abwewv4G7+nnsW9VSMv0MJSvCqE0QYQCxE0tBmFgJRBRECp
	 Gcc7YZXcn6ZVjnnOFNPWxF9MXqXyhFMV2/rtAU9seEjQdh1t6qZiZ0is2C0JPXPhBn
	 2cYzSNQ+wv0QUFUGa/aTz2gJSJZJA4ed1dMrx9K6NARl0UOWe3qrF1pRaeGcjSPDkw
	 D4ktPFXCkzERe/9x5RNai4KmjZT+sqqQPICvXI7s+TI3/NID3cRU0cs8f4vrDqo6yN
	 THmNV9Nu9oWReHHUKBYPcvAflG6BahJmiGo3mGEaRVmOB4tsJAqcsgQbvaJ4aWQ8Xg
	 08DYkx/Hy2gVA==
Message-ID: <3ec53a2e-a8e1-43d3-abdb-c00433e7675c@kernel.org>
Date: Wed, 25 Mar 2026 12:27:13 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] arm: configs: remove obsolete assignments to
 SND_SOC_ROCKCHIP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Gonzalo <alexandre.gonzalo@arm.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Mikko Rapeli <mikko.rapeli@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
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
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
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
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
 Anna Schumaker <anna.schumaker@oracle.com>, soc@lists.linux.dev
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
 <20260317-arm_defconf_cleanup-v1-5-8eecb7fdd24d@kernel.org>
 <febd0f7e-59f3-4ba4-8706-53c7353e3fe5@kernel.org>
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Content-Language: en-US
In-Reply-To: <febd0f7e-59f3-4ba4-8706-53c7353e3fe5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,kernel.org,linaro.org,gmail.com,armlinux.org.uk,iki.fi,kemnade.info,baylibre.com,atomide.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linutronix.de,goodmis.org,netfilter.org,samsung.com,nxp.com,pengutronix.de,mleia.com,timesys.com,glider.be,mobileye.com,bootlin.com,HansenPartnership.com,gmx.de,gmx.net,zankel.net,suse.de,arndb.de,sntech.de,renesas.com,quicinc.com,roeck-us.net,oss.qualcomm.com,linuxfoundation.org,oracle.com];
	TAGGED_FROM(0.00)[bounces-13930-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[98];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailhol@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: A2BCE32402C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+CC: soc@lists.linux.dev

On 3/17/26 12:28, Krzysztof Kozlowski wrote:
> On 17/03/2026 10:13, Vincent Mailhol (Arm) wrote:
>> CONFIG_SND_SOC_ROCKCHIP was removed in commit cae3cc435db5 ("ASoC:
>> rockchip: Standardize ASoC menu"). However it is still referenced in
>> some defconfigs.
>>
>> Remove any references to CONFIG_SND_SOC_ROCKCHIP.
>>
>> FYI, the suppressions were done using:
>>
>>   git ls-files -z 'arch/*/configs/*defconfig' |\
>>     xargs -0 sed -i -E '/^CONFIG_SND_SOC_ROCKCHIP/d'
>>
>> Fixes: cae3cc435db5 ("ASoC: rockchip: Standardize ASoC menu")
>> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>
>> ---
>>  arch/arm/configs/multi_v7_defconfig | 1 -
>>  arch/arm64/configs/defconfig        | 1 -
> 
> This was already posted:
> https://lore.kernel.org/all/20260313-rockchip-snd-cleanup-v1-1-77d9a953fd1b@schnwalter.eu/
> but just like that patch you did not send it to soc@ (if I am not
> mistaken... CC list is enormous).

OK, I will add soc@lists.linux.dev to the recipient list in v2.

> I think you are mixing here independent works, like kconfig and per-arch
> defconfig changes. Please split these per arch defconfig maintainers -
> patches and patchset, so you won't be Cc-ing 50 addresses.

The config issues which I am addressing are transversal problems so I
was expecting to just get the Acked-by from the other architecture and
have all this go through the same tree.

As I explained in my cover letter, this is not doing any functional changes.

But if this is not acceptable, I will just reduce the scope to arm/arm64
then. Doing a per arch split as you suggested would be too much overhead
(more than what I am ready to invest on this clean-up).


Yours sincerely,
Vincent Mailhol


