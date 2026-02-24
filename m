Return-Path: <linux-mips+bounces-13194-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAd2BGBUnWk2OgQAu9opvQ
	(envelope-from <linux-mips+bounces-13194-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 08:33:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5229183120
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 08:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57FDB303714A
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 07:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC2D34A795;
	Tue, 24 Feb 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOxpnb9D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB61C5F11
	for <linux-mips@vger.kernel.org>; Tue, 24 Feb 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918316; cv=pass; b=jPX/Oz9mxEz6zTz1jSmCTM+79DMAKJRbxxyY/5cQLT3pxQ77xVsWkcv4keYJHHECFs7XRiNe2lAxZ0UPu7NBGJpt29dlxjdT7HGxG+ZfOkQcJeiQvrC9YK+WwYa63bp+Q/r1IYcWCCQSpryZDSF7YTUqSxEfpOr6ssbXF9xZZrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918316; c=relaxed/simple;
	bh=z43Cp/+0b+DQ/UmystyDX/o54828M+JOLwEhgYAzil0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUWfv/IeCN2AjdjzESOgnAPw+1/CkvKHk4QARljfNBLLjDk281FdEvVxB7QNqjMJdMx7g//6VZewcf4ZnwJ25v4+YFC3G17K2sW8ainGvyKVf8+XzbK8Ru1ikaiZ0WHM1UBgfP/KDiNbmR++zFJ65kkOteD49LQ3Y92b2mX7Vdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOxpnb9D; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124a635476fso4865351c88.0
        for <linux-mips@vger.kernel.org>; Mon, 23 Feb 2026 23:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771918313; cv=none;
        d=google.com; s=arc-20240605;
        b=dz+7mfMFnKQrlD7TQ3b26l7d3bIeeFHADyvrTsPQ2GbBkEwPSL/6c/SqQRXLXNMtRm
         V7rU6qBHh3jYO82CCZTbN75LIUdZDH55yg2IuwoxfVshX3IoQG4ax36zsYufMZvK47uS
         +H+6L7LCpiD0HDEVcvyCGTN1fyGP8YyPZnnVxXrFFG/SAdqXSN+4p5FD9pFWbGTmS7U8
         PkaiEW9DaofqRqJa63Sc3UNwqu2GXgJ8kPLllgzY8fRXbnebJAi900lR9OziQEz7ql8q
         qR3XA4cw++4RKDnUUkxKVj9B4dGxGcm5eC92QX+W/BD8hT7zQ7LsO0OrhYdoIdQv08bN
         KcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7O5brEuc4hHOUqgF7dos1OUBEpYGd7q0nwtKnTvzkg=;
        fh=ItKMW3FmT+7hNSnz/02IEDPZ0tBySzbs9hHFEeK6c2U=;
        b=g/rJUzQHa3INFrYHR8gLZmtNUecZx62dl3qmP8RSHJGvZ7flA3RTyY1XOxNB0nLZ/o
         0ixXls2br1ifbt9y6sa8oDdcxRyNJYdCt7gbN8Gv03N/BkAFLHjzKS4Hknz1PWprqWmY
         kaiMLovhCnhrmuHipkiBICD39W7dOupdilxhyLXHzZwK5OE4RDDWTjUVEjl6GEeo1UxZ
         p4+asI/SvODfjKBE/WUNTEwwOgMgBJup0LXE7VH7ZZgojyw/U5gh1z/oBrupx11A7tcw
         1NLjlUexwL0MMq5c2uYH3R/062GN716l75b8Qq836sjQ4K1DvGohfA/4HIteRB5ZxKb8
         nqcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771918313; x=1772523113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7O5brEuc4hHOUqgF7dos1OUBEpYGd7q0nwtKnTvzkg=;
        b=aOxpnb9D7esJI5Rrz3rf8MSQV137M0FnCoUiVci2bhxlaOHsaoCtC6LIImHXBTOm1l
         XS4II5dW2lkAOJnDd0kUPARRpL1j/PQIQduVL+FuLa41fGQcvq0v+jEz++/ti1MmsJz4
         MhhKfCtZMTslkNC0Kvj5Re4CufddZtapVjmFTE26p41gIuR8boDS07IZDFdvAGupGh3z
         biScGqxXyKkE4kbg7gL3WIR/n54789se9Y1Aka6rB0rfYDzpSx/cQLN19pue5fS6CggP
         4Y3ILe0x2Han4Uzm6OjekRSQASGv6K3UcUyKLEgJ6ZWHoBB5KN+HVONK+le0kDRpzQ+8
         h+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918313; x=1772523113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P7O5brEuc4hHOUqgF7dos1OUBEpYGd7q0nwtKnTvzkg=;
        b=hFDyBo+1NGMfAgy/Vy91OHDWQUXgsEic67hif9ecfOgiHDoNMfd9V/FLPuGKnQExw5
         PS2Sl7kFLrjOXYVFuhNN8DMG0G4LZg4gwaBbWdnP3ogHdvd6omLVTMMOIDGI6WAknFYP
         rWfAQMrpGdZZ3+aKLUXnAl+/tvzChyhULOkBxp6nvBcJNENFKq8L2xPj28m8BdkXQRif
         rYgmmFiWmO71tpywmGSZdc0ziNae3QptWKHiER3Bu5x/TvMZ1a//3MCXx0o+5eFo+VFA
         tu7tkwHolkSYJjSOTyuboGox/af6uoORzRQW5G2MF3/2U1MpoLYDzhESg0dRAu3gXkQY
         GaFA==
X-Gm-Message-State: AOJu0YyFGKJDLENKPmr/NACyAF0bZJLw+FxaGxQ3SCLwExSZfpLkJ1G7
	bPjfkjfxp5anN/KLNH1glAd5zykluZcKNCXBjNZ0OhSNOL0gxOL2n9n11v4dMAvB/smIqJmhB/M
	JeVmjLi2r3GGGIYpBu7Oqu7PSSrSzcBc=
X-Gm-Gg: AZuq6aIRYtU1Pu6IcnL6koaGgHz9trLjI16v+QDLAk/wJFAyw2tyy3czg8j6Ysu/uww
	FJoKvVbx5cgYBslXAbETYik7m4BgOPfCfKkrdtmrjg/tfQjLMndEtGtoZgd5QMI05zubPQkfxS2
	fSpbS0XJWTfgYttq0Cb4Mw8FlRVBXwPGsY4+HZDBAM6xBCoDGhzbrly53uNg7BnDYryh0zNYIzX
	DIGl8RnEl0u2HQqgoVHrYlmwSmbNSKvtgG6dInTDis407u3B09K1fLIQCWPz/+Jh2RG6somDI9T
	RAWhBRrVARMxuKE3
X-Received: by 2002:a05:7022:2383:b0:11b:9d52:9102 with SMTP id
 a92af1059eb24-1276acb1c8cmr5486833c88.6.1771918313381; Mon, 23 Feb 2026
 23:31:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OS7PR01MB136024C7662EB4DEC04ABC648BC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB136024C7662EB4DEC04ABC648BC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 24 Feb 2026 08:31:40 +0100
X-Gm-Features: AaiRm50v7zX3ShhjxV09DUlZf9T9Gg4X06P-eS7knGjPR37Dt2Jm4TGUUT0baIA
Message-ID: <CAMhs-H_7O-751=gypxHUUdBp01E4HqqWYVh2GUJO32wixQiUyw@mail.gmail.com>
Subject: Re: [PATCH] mips: ralink: update CPU clock index
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Crispin <john@phrozen.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, stable@vger.kernel.org, 
	Mieczyslaw Nalewaj <namiltd@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13194-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,phrozen.org,alpha.franken.de,yahoo.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A5229183120
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 3:23=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:
>
> Update CPU clock index to match the clock driver changes.
>
> Fixes: d34db686a3d7 ("clk: ralink: mtmips: fix clocks probe order in olde=
st ralink SoCs")
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  arch/mips/ralink/clk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

