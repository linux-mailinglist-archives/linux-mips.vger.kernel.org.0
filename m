Return-Path: <linux-mips+bounces-14635-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAT7OSdPDGpIeQUAu9opvQ
	(envelope-from <linux-mips+bounces-14635-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 13:53:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E557E141
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 13:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFBE6300E03D
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 11:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326CD233941;
	Tue, 19 May 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMWwP8Ap"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0733688B
	for <linux-mips@vger.kernel.org>; Tue, 19 May 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191550; cv=none; b=EF1L1Oas3FPOaEbcOmIzIYT1WmwLtibMz8RlZsBKD/CNRDawlc80l1YtkfBDSwCfS62Oec4Z4InPJi6Er70caWu122iQnZLZ47f6aEvRwc9z/SRZ8jir5A9jJFESVfNhwC4OFUXwGd5fWmIOzBYwnaGO1dC7XkkwWwQu4KqYZAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191550; c=relaxed/simple;
	bh=RFREe1iuGXg4OG7UJZqauRfAs0EQEXBJIU0XAqVC3Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxxMSyXvkYee+MnPqm5Ah5O+WQg/xbCUIt6aQBMxlgJoJJnjFLXVmMR8DgrAI3+X1nZ+HVgmuGZTyDU4Kz0y1bUPvjyeC+eskp65ca1a/v5N2cTLkyNrwzopWw1gl6zP5n5AzL8asfWCk7aObzHdJ6UHSAZaoSsAXkUOrvCtfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMWwP8Ap; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91C8C2BCC7
	for <linux-mips@vger.kernel.org>; Tue, 19 May 2026 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779191549;
	bh=RFREe1iuGXg4OG7UJZqauRfAs0EQEXBJIU0XAqVC3Zg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WMWwP8Apo7+sBtWAx9wAjbG6lX/KJVsj1ispnH17ZOCaEcC2OpMqfIu72SL3xM2DN
	 mEf4de7VYxSVkjYdi+eyO5v6xBxgp67u0ZTGP3v4mT7Y/UDfBKTa0tCotmYGjORk60
	 nC/02B+7qB93449CS6e2wE5JIUjgDQRj+tYxHwddgvdpAKFD773Rc8upIUlGl0MpK7
	 q/oAqrsJGH4xNXEucqFgwYp3zhd1pmYS9XlA+LQAIlHqc9Dzc1gG3Sf+e+sVcd3TpQ
	 wAL6YaAQ4ZcSB2jxJYGVQ8p6b6E+7pVjpNv2AKOdjB4GWCcMzceTt5ASHCjiD0KB+g
	 tTyKpObc8jKDA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38be5e86918so46003131fa.3
        for <linux-mips@vger.kernel.org>; Tue, 19 May 2026 04:52:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/T3biE8TSlIZPW4gtX94bGw5XFomRIri7PYQh07y4ZDYEhSZro4CKXltoHmcRgjm8g59YaxKuU0jye@vger.kernel.org
X-Gm-Message-State: AOJu0YymtQpGtVoEYY5XQ4HxHX99JVS9oDxiwLTWI6ZGFNm22rWvyNJv
	BMkrjaiCxCTpHNAfB5qYH4h3N4bw7MBAbWng3VosYtpe+ggPmkaOhKz3r010h1Undqgfa2j+dVY
	pIc2PTijipPgJi3zBGJrsWYD2wxPB4pPCFzhcP0z4nw==
X-Received: by 2002:a05:651c:1503:b0:38c:6b7:ad39 with SMTP id
 38308e7fff4ca-39561a2b235mr56493171fa.13.1779191548566; Tue, 19 May 2026
 04:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com> <CAOLZvyENGzU7NqedQCfT3dcchUJjxRr-WJWC4ubqViLD6yzTUg@mail.gmail.com>
In-Reply-To: <CAOLZvyENGzU7NqedQCfT3dcchUJjxRr-WJWC4ubqViLD6yzTUg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 19 May 2026 13:52:16 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md6=Zn0CDt9=UsFWtT7FesefKEKk3jrvhhKTL9zPFPL1Q@mail.gmail.com>
X-Gm-Features: AVHnY4JqGDJD3e1znNmdR9ZfR4smCzSeUc4MsR47JG89sfmTWtvUwehVeeoTULw
Message-ID: <CAMRc=Md6=Zn0CDt9=UsFWtT7FesefKEKk3jrvhhKTL9zPFPL1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14635-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,alpha.franken.de,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 883E557E141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 5, 2026 at 3:31=E2=80=AFPM Manuel Lauss <manuel.lauss@gmail.com=
> wrote:
>
> Hello Bartosz,
>
> On Tue, May 5, 2026 at 11:09=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > This series of patches updates board previously converted to use static
> > device properties/software nodes to attach and use nodes attached to th=
e
> > respective gpiochip devices rather than simply defining unattached
> > software nodes with matching name. This is a requirement of newer
> > gpiolib code. Note that there is currently a workaround preserving the
> > lookup based on the software node name, but it will be removed soon.
> >
> > The additional 4 patches convert the remaining 2 boards to use software
> > nodes as well and fix some build warnings.
>
> I have run-tested this on the DB1300, without any issues.
> Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
>
> Thanks a lot!
>       Manuel

Hi Thomas!

Can you please queue these for v7.2?

Thanks,
Bartosz

