Return-Path: <linux-mips+bounces-13931-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NxSB7fKw2mVuAQAu9opvQ
	(envelope-from <linux-mips+bounces-13931-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 12:44:55 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1708F3241F8
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 12:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFD1D306AE25
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 11:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175DC3AE1BC;
	Wed, 25 Mar 2026 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHlhU4Kx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26902D3EEA;
	Wed, 25 Mar 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438242; cv=none; b=rq+63bPkUPArUVjxU9zyh8Zeae7Q0u7/Sfh2vQ18jZw1iikDTFxd4jDPbMvP8ZfwMg/8V4+ajFsSI+tqvZVIxB4jsleZFb3icv0xFNfCT3Si75PRqvC9RncwQgXzlKpsFd1sqJwtfEXBWkcRj5iD5wJTJztpl1It4/+KqCxA9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438242; c=relaxed/simple;
	bh=8S5TmAtO06iPDjR/APd3b8qCxwJUHlbb5SphhpG276w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTUTfwo33rNvAzyAOZv7VmOu1z58FirL4UNEFLy9aEcSamb6NN8BkPfJtu2ns8epCAgf6YtWYDbP1iNZK1IMDqEOCa8ViOT/72SCKp/XYyIHlk3m8rzaUayWC4l7YRw6JUhCcnDUB+mfa/OKMX5Iwi1uHVtqiaGC7Y7PZTjPiIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHlhU4Kx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C58C4CEF7;
	Wed, 25 Mar 2026 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774438241;
	bh=8S5TmAtO06iPDjR/APd3b8qCxwJUHlbb5SphhpG276w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OHlhU4KxW0ESflRCv12pLjiQ+K8rctrZiJQGTHZ5zqSdcRsrJ+cxVUo6WS8ygPrf1
	 8g7tl4rlzjpeKvDFoE4D8YIq1qUwh+8UzaTuaKfUlkEcFDTQFwoJ4gJkmdiVlNp866
	 AgerHFgrIEg9Q1Ks+TtwipZcpLqyLQgni7r62gXQTlpi/ASdCLwCySKW66kVtBDFTM
	 RcmInCOhNJGbFq+WYNDvLuX3agPqqgYzgsGM4Fo0+aJucZNi6M1Pf/qL712D8Yyj9J
	 z7332+wGqDsyg7Nd3cJPGVzCj6g5HdxtxMt1nQMHYvgjYotrDLvOO3LnEqXi4zoYya
	 87r72ru0E6+Vw==
Message-ID: <6f463bf9-7c17-405f-81d0-bcce82caa2a4@kernel.org>
Date: Wed, 25 Mar 2026 12:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: defconfig: remove incorrect assignment to
 IPQ_APSS_5018
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
 Anna Schumaker <anna.schumaker@oracle.com>, soc@lists.linux.dev,
 Ross Burton <ross.burton@arm.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
 <20260317-arm_defconf_cleanup-v1-7-8eecb7fdd24d@kernel.org>
 <ff697bee-2173-4311-9089-0875114d54d8@kernel.org>
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Content-Language: en-US
In-Reply-To: <ff697bee-2173-4311-9089-0875114d54d8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,kernel.org,linaro.org,gmail.com,armlinux.org.uk,iki.fi,kemnade.info,baylibre.com,atomide.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linutronix.de,goodmis.org,netfilter.org,samsung.com,nxp.com,pengutronix.de,mleia.com,timesys.com,glider.be,mobileye.com,bootlin.com,HansenPartnership.com,gmx.de,gmx.net,zankel.net,suse.de,arndb.de,sntech.de,renesas.com,quicinc.com,roeck-us.net,oss.qualcomm.com,linuxfoundation.org,oracle.com];
	TAGGED_FROM(0.00)[bounces-13931-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[101];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailhol@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[get_maintainers.pl:url,linux.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1708F3241F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+CC: soc@lists.linux.dev
+CC: Bjorn Andersson <andersson@kernel.org>
+CC: Konrad Dybcio <konradybcio@kernel.org>

On 3/17/26 12:31, Krzysztof Kozlowski wrote:
> On 17/03/2026 10:13, Vincent Mailhol (Arm) wrote:
>> CONFIG_IPQ_APSS_5018 does not exist and never existed. Remove it.
>>
>> Fixes: 7f0c87348fb5 ("arm64: defconfig: Enable IPQ5018 SoC base configs")
>> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>
>> ---
> 
> Just like try one year ago:
> https://lore.kernel.org/all/20240104133241.2030193-1-ross.burton@arm.com/
> 
> No one will apply it if you do not send the patch to right people.
> multi_vx and arm64 defconfig fall outside of get_maintainers thus policy
> from maintainer soc profile applies.

As you guessed, I used get_maintainers.pl to generate the recipient
list. I am just surprised to hear that the defconfigs fall out of the
usual process. This is a pit fall as shown by the fact that both Ross
and me failed to send it to the right people.

As you pointed in another answer, I saw that the documentation was
updated. I will follow this from now on. Thanks for that!

> This one should be send to platform maintainers, so to qcom.

I will add linux-arm-msm@vger.kernel.org, Bjorn Andersson, Konrad Dybcio.

I don't think this should be split though. My series does one thing:
address the warnings from scripts/kconfig/merge_config.sh. When a series
have a clear scope which spans other several trees, it is more common to
collect Acked-by tags from the maintainers of the other domains rather
than splitting.

> Other ones: please send all arm and arm64 defconfig changes in one
> patchset to soc folks. Here, at least provide credits with Reported-by
> to Ross.
OK. Although this was re-discovered independently on my side, will add
the Reported-by tag to give proper credit.


Yours sincerely,
Vincent Mailhol


