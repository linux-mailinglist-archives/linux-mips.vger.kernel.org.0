Return-Path: <linux-mips+bounces-12454-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B45EECB9013
	for <lists+linux-mips@lfdr.de>; Fri, 12 Dec 2025 15:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CFCE300A37B
	for <lists+linux-mips@lfdr.de>; Fri, 12 Dec 2025 14:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B2E299957;
	Fri, 12 Dec 2025 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MO2BvpEr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350DD19D081
	for <linux-mips@vger.kernel.org>; Fri, 12 Dec 2025 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765551062; cv=none; b=rcSl4BmFBd6PtLfd4Q6MNUQsBarLT3csEdWDaBkCrDsFzZXd32ACg7KYa0IxxQq3y5AbBe98Jh1wBwk2uXE/pF7DIz4KnJuTLBCQtCCGwEYYUdtg/eJpe8gDCme0RCldmvF+nmsnoe7eIsAeOVdISXcbopEaeQyzGLioD+CfIqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765551062; c=relaxed/simple;
	bh=+MIXhF/gjPgo44+bRwvZguWOeJUhSLHk0unMb8G3riI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=icuQPrUtabgGSrjweiPCsyOXb6UgI8BsSpRBnIcrqy/7NnZXeZdRuk6Sn0fmrDz6FD4N7QzMnRgDkSMDPMx/kzlIoUe00IURi+qpGryYo2F6eVBwh3vs+BwqQzf8jy+LPCYJSj2JjUrNhBVBMaRYscuTtbH3oDXANsnssZ2Nr60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MO2BvpEr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6496c4ed38aso1879860a12.1
        for <linux-mips@vger.kernel.org>; Fri, 12 Dec 2025 06:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765551058; x=1766155858; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MIXhF/gjPgo44+bRwvZguWOeJUhSLHk0unMb8G3riI=;
        b=MO2BvpErBCuOwXqxNkd3xG1AxU1Vtron2tInZ8q2HrDuElXG1SgBhjGF91va+AKYvw
         v+j78uhp1PIz/0e9CC3qdtBv9Mj/G8HCp5RShC/Q+uMoCVxfOX+O9nJwdWQqGwcBY7gP
         PxFgTnuJGNpaiQt/JtweKDavGmJOY4ELkKP9/RnRNC0onctDkDKFSUm1YywX1JK7hEpL
         MSHmY+0ghdBb8bK2kfrvUaMEoaZ7SvJnEnbkrRiYAWVWMXanBBFN2hNOEIyy2tFdhdt3
         woOZZ0mMVLso74YsaRp50TonZH//tRTVsaxkSEOtSarxflIGakOLHFGNSH1zS8Y0T3QF
         XDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765551058; x=1766155858;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+MIXhF/gjPgo44+bRwvZguWOeJUhSLHk0unMb8G3riI=;
        b=trcTDS6S7mL36VdRBmWcR8ZI9iz5JXkplFVG32JcpxaW4aM1Oo3rG0UY0rl+9KS1Bl
         hHYmkru1Nn0cxOsg31RLQSZDUXAmBKMmZgED/wO/G4nMNH+bhCXuEVGFl7QqUtXljcYP
         vW0vo2n9+i73R8q5K6vPRMYxOHRligjAksZUAczlpZtzfbTXHXiRHqEVayIEnZr1IFEr
         YFTn7JdLN3AgCJsRIPR3DZBLxIcez6ZuiDBuP8MAb7xSE79s9lhAx1fs6QnFGsOrTcZh
         bi3RGAzfUX26cpHKeR0vXw4dNycKnmFrTie/tVhvaDfwdoSg805Tdl4CO8z6+f0MWAAs
         zC7g==
X-Gm-Message-State: AOJu0YxK0qT+F1Lw7cTq3BanIzTPjF6pVq24BWCaTdVWkNfg4LTRKNWH
	ZO8r/7Mo3qa+jrDXgBZ152liDm4y+oyfrj5VP/V16I1FS3vnVGhPgr8QLSObkqaJsQxEaPb4iHU
	+QVTXj9WejAGlOMHzplcyIdeqVOtzC2D/5HZCqGU=
X-Gm-Gg: AY/fxX7LOaO5dpMU4sYl8eSMkSikfvlldQ4CUP/F5ujhW+eNtIJT+g7NvFCcE5q9yfy
	2hcCMPe6wPniZjY3xObSH1MWfD4n7nFpUapH4ubqp2oS1KGhBNajUij435vPbZd8BpqGvkBMQjW
	rc2F80zLEYRsg5DcCrDKlwyxf0JBD6FjmiblFmasDsQ0FfVcPaxrXaUIJYXGVOsNyR92HiORTWF
	+IrYKOTUDG4B1SemqaIcoSykNaMzu3ZRHIuurcu+Hn1yCdxuQ0VD3qMaZ8KJff4ghvG0NK3UGrH
	tzaIW6ftVtQfNOIYJ3O2TAAu6hT5txDMx461UrUVjYfzZWpukl3Xne3P4sA1j8qfozG2zgvLI9d
	1hhiytXoqC2vzy3ljhBhzZf8fHDLvSMYhbl9QIl68NUnQCBqtDWsZv9uCqTDTJ/7suLiOjl+kzg
	EbisZdQkK83Cc=
X-Google-Smtp-Source: AGHT+IE8DjSx8n4DcbaHPlzlbODzUWFpaDFlIC+9t/hXsagcJuxakaOLdKl9IXWXjV4BShsRVWU4PtybA/nLMf03aIY=
X-Received: by 2002:a05:6402:5243:b0:647:54ba:6c42 with SMTP id
 4fb4d7f45d1cf-6499b1227c4mr2056426a12.4.1765551058063; Fri, 12 Dec 2025
 06:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOoiW7LwuXB5o2iPtVs4gDDoL3i9vFK8p=rg_JHfa4V6vraObg@mail.gmail.com>
 <CAOoiW7JurfCCFUQxvB-MfLHANMLPCt86LFPL2LgxNMe1q_8ugQ@mail.gmail.com>
In-Reply-To: <CAOoiW7JurfCCFUQxvB-MfLHANMLPCt86LFPL2LgxNMe1q_8ugQ@mail.gmail.com>
From: Hunter Rules <huntersschoolstuff123@gmail.com>
Date: Fri, 12 Dec 2025 14:50:38 +0000
X-Gm-Features: AQt7F2pb4RPjTgU_wg9laq8dLqJNlrw5madnPfdRaP3E9gR79gsj5k-kx1T0UjQ
Message-ID: <CAOoiW7JtBG0Ab36rhytF8+wUPjhH3t5YYMNdpSmwbqTL+xRN+A@mail.gmail.com>
Subject: Re: Attempting to extract a embedded Vmlinux Image that has no .ELF header.
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do not attempt to fix this issue with the email I originally sent. I
apolgize I got to carried away and excited with grammer errors
everywhere and a confusing mess of a intro and worts of all I sent the
same link twice instead of the working vmlinux and generally asking
here for what is almost tech support was wrong. I may rephrase and
repost with more info and fixes. Im sorry for wasting your time here
and for messing up the initial request. I am just a rookie.

On Thu, Dec 11, 2025 at 4:39=E2=80=AFPM Hunter Rules
<huntersschoolstuff123@gmail.com> wrote:
>
> Apologies but the top part of the email must not have been copied and
> pasted into my email client or spellchecked wrong, its good to see the
> core message still remains readable though. Also, no, I did not choose
> to be named "Hunter Rules." Sorry for the first time rookie mistake.
>
> On Thu, Dec 11, 2025 at 4:28=E2=80=AFPM Hunter Rules
> <huntersschoolstuff123@gmail.com> wrote:
> >
> > Im trying to extract a mipsel VMLINUX image that does NOT have any.ELF
> > headers, but it 100% of a valid vmlinux binary in there perfectly
> > sealed so I can run it in QEMU (the 2019 version of QEMU, as mipsel
> > kernel support no longer works on modern versions)
> > https://files.catbox.moe/55zxkn.tdf
> > Original name is AppKernel.TDF
> >
> > I know for a fact that this is a valid vmlinux image, None of the
> > infromation is compressed or encrypted. However without a .ELF header
> > loading this is useless. If possiable id also like to see the config
> > options although not likely.
> >
> > The kernel is based on Monta Vista although it is pretty much the same
> > to most other distros
> >
> > For reference here is what a valid Vmlinux image looks
> > like(https://files.catbox.moe/55zxkn.tdf)
> >
> > If any linux wizards out there can tell me if extracting the config
> > options from this image or even getting it to run in QEMU for having
> > the same exact same arctechture would be possible. The actual VMLINUX
> > part is 100% there and not tampered , but without a proper header it
> > just will not open.
> > Thank you as the reason I need this opened is for a operation im doing
> > that's really important to me.

