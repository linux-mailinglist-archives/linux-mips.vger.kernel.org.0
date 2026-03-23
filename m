Return-Path: <linux-mips+bounces-13871-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJE0LtwCwWlUPgQAu9opvQ
	(envelope-from <linux-mips+bounces-13871-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 10:07:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A832EEAFF
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 10:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E49593034CA3
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1173638642A;
	Mon, 23 Mar 2026 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8z6WKCi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D393859E1
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256635; cv=none; b=angHMUb8S0ZDwMn7vc1sHQ/hXBIOY3Ue0Kk8TvDASKdgS9OB89i8CiYEFA+QkwRLnCw6dDSZlDamNTwyfD5/7RVVzfAqVhQwqd76atHgeRYahA+FqAkGbv/8LSWU3b/67Jt7iCoQWAfzEgzyeZO8nnDNtsSxQB+yjnjKYzjkwgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256635; c=relaxed/simple;
	bh=Y6Ln7apokh/wc0AOi/toxBUgq+c7baqtMbdqFe1JR+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ+8XwV9C72IsfK/GjC1DEyxuPrnGVZNeHHsEqEVMPxSteiXYPprMM2HoO22hnvwVbFDCfRaYM4q4QEu7yl+WDJ7tM8wioYO2V5TSWnVN7fl7jAjYTHmicOceWJsb4PU5tcLN4WyxSU1Yt/lIKdW9ncT1BZyXgeP9jKHjuty6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8z6WKCi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F35C2BCC4
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256634;
	bh=Y6Ln7apokh/wc0AOi/toxBUgq+c7baqtMbdqFe1JR+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V8z6WKCi5Zsoe+uxCF5locHBMfndoMqJUIb3dbz8gIFPVW0vzOoTHca+9gaYnHiQQ
	 hrRXi/zQwDPRMkSc5/sSxhCktqWAiUpuM9GC9WC3870hjvxhKVV+C2AOQVxTl8h3Gz
	 VM5AZvnrQ/j5baJa2Xcgi/n5bbyvai8OKkDwKd2RPtfyV2bHzTs+7xP3G7sC2kvRua
	 pzXTiQsuj9qx8E5+dKS33jZczro/rs4AqaT0nzMjnLlbhHSSUoqq2pL3AcCCg8fQIl
	 d4T58fNpVcEr9WJJh1fVY70yaIRYgShJ15l/92CG/+ggpJPhAlGDW5N8v8NbtcTu2v
	 BWPfF+5+Mhprw==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79a40fb9890so23062007b3.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 02:03:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX09n4oKEJUAErrxSRlegnn65WVKRKEcQtFG7g/uv+BAD9XQzZd1hlsq8ZgdwH5e2MjQ+VwMFuFChss@vger.kernel.org
X-Gm-Message-State: AOJu0YysuIE+dh+RNXzaff2BL6ipRfyn1qb7/EI9aA2JYvPX60k0Vpzm
	3KvuFgCO056gICpbraa7HC1VH6VqxnIaAsGtti0D2dC3KidMHAh1Qz5nzB/oxOcFD45eXN5lF/U
	2/YiWP3hJux2D7rwgNnPCa7XngVq7T/w=
X-Received: by 2002:a05:690c:c513:b0:79a:b77f:3fe0 with SMTP id
 00721157ae682-79ab77f4a4emr19423007b3.5.1774256634011; Mon, 23 Mar 2026
 02:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com> <20260316-eyeq6lplus-v4-2-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-2-bf44dfc7a261@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:03:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+z13_oZO0XLm9Q_sqwDq09-qYKN5PQiZCOZ96+9LkHw@mail.gmail.com>
X-Gm-Features: AQROBzAs6grpZb_qsDNBkL3kogXuOOZDTkjOH99AKL5DVmwWAn4NYFh7gNmvQi4
Message-ID: <CAD++jLn+z13_oZO0XLm9Q_sqwDq09-qYKN5PQiZCOZ96+9LkHw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13871-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 36A832EEAFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 4:25=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:

> The "Other Logic Block" found in the EyeQ6Lplus from Mobileye provides
> various functions for the controllers present in the SoC.
>
> The OLB produces 22 clocks derived from its input, which is connected
> to the main oscillator of the SoC.
>
> It provides reset signals via two reset domains.
>
> It also controls 32 pins to be either a GPIO or an alternate function.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

