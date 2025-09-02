Return-Path: <linux-mips+bounces-10958-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC642B403CB
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 15:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 557031B63FA3
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 13:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B913148BF;
	Tue,  2 Sep 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8WjY/OV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391130DD30;
	Tue,  2 Sep 2025 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819772; cv=none; b=GNrGUVjrr9gXwMpKTHkCHu1TnIl+A48esACEjuiWwjI2GE4KzTO0qThF9914Ccr1+Xi1+CBRKz0/8hh0NFhbIkc7TG7Rd9ii0L7w5LYXbhfyD7aPMt0+bscOghaEChWoyWTo2NH44GF/8vryWikXwGMpvPpDgzMzuyTGpcHSrs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819772; c=relaxed/simple;
	bh=+qnsGe+tD6ybWDl00Ihi4djJ37mafLqwtURRx0yItGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3uWg1iz1mpZkvXLBXXta5hefWNk/HS8FUcclB7ZD46fauNc3EKSkhYznFl3yMuSj4YTcN7XI2Dm5RIKFFmyVXSdSILzMCDLtwuSr4AP84BVBU/uFF+y9ZTsHPCshdLZmhds222OeeVPuvIiOMP+ZhNYovuKWxtJz028ggvmDnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8WjY/OV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61e8fe26614so4316215a12.1;
        Tue, 02 Sep 2025 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819768; x=1757424568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fGm7QHNO1eNDAPTjJ+w42zov3+cLbPVeyZw3a1UIkog=;
        b=R8WjY/OVRqbvgncjV9f43QtYUvop+secLCz1EcwzHp4v8paB5thUoDQfg475zIc+6u
         vIemoub4ru8nQ2bZ8HDqaqjiorDNELeha4RgxtkE/FYp1Z7L3Ko4sgS47L548wgirZ2N
         DkqY0TlUluYXM2eYtUZ/tjxwdlpoHeBOMAAUBa2594cYIwAEKJ3bh425jmQ7XZmiBnFb
         IBXi6zm2urEDN41pQ+KUkF+vdeY7o0wYi0m6IE/ZXX7AVWkrS/OQmhXf8XseqBMrKVZf
         U8VZDgL7zA4kF5783tKFv9gK53V4ULpJG72AnSAcdPNHUIjCJYKR9Ew+hx60obNnxdov
         /eWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819768; x=1757424568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGm7QHNO1eNDAPTjJ+w42zov3+cLbPVeyZw3a1UIkog=;
        b=e7hSAcBG47B1kNwaWFZMokiDzoiZYe9osFPp2TBFq/4Y27Vt+4pGvTNcSABjq/Kd+d
         a9FqK9n4jaSoupQGe/zCy0Ga/pohvY79iFfSmlVpIjHdSa5eOq3ILgVow/BFL9ZvjLHv
         mrhgEHSCOdgDHSfAhyVltZ2EoO7w5PoI5TCS/WD+cXh5XiO8bqjKeSI8bccgbrkO7pR3
         5D7YHouHfkn2wYXCiyTFiaisGJdBHvnrmGlXpSegTVn8s7Cz0mZpSCDWKV/Eup5CtOy9
         tT7LVbu0RD6/vrxokMRGxd9X8ayVY0a1hi53tekJShm2PX8g1XvyjG6Joy1BCZ40OMJ8
         vNxA==
X-Forwarded-Encrypted: i=1; AJvYcCX9m4UTevQQs2GvPHkxFjxxEorN3NGiNjx4s0SH5WAD2Ev02fKa4WOSx+iB/tpnVKxtiIw94QRIlMLlMi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyui2WHW0fbwbjQ0HcCDx3gmy6urwXo0yoZKkybcgm+DQmDDfYB
	EzXdhGzeCeMLAXXGeyrygT4+jyUb/qlAC/FChcHOv5e1gYnUczd+2LG6
X-Gm-Gg: ASbGncvos/JtwLU6UTo5CEZZiDp2O0902CBBqByiD7viGtAu05DcXCx9Xpj4WW6XkTl
	uWzZDxmG9BVjAzHdAOg0FKMQuq66Zn+Jq4ov8b1uTW/AQ3x5SyL3cbH4993FUvuN5zHrI/5Jg0H
	MMFLtp1DjrBXC58RKPi4yPCH3oVsvFHH2i8ASkWoGfo1buRDeZdtQNWUtvMDaWxnxpm0tvecRQU
	tSppDYM0+GPZ9aJdxAwSLc9FTO1CVn1++vHkfikSyShc2iMGFqSXjgcMfGLpsC6+INEl/m85vZ7
	10HdCqSRXStCT6GCF2fMpVXtyruMRE3xI3s2kLgoDwuFbwod24pXUyB0nrMNbn/mqBOt6fIdvUy
	I0KCMJB5386LC0CK5+/TA9kIoe4Gp1INXU+x2H/Bg8CubrVHvIknGkDjDe8rV3g1TVKx5OGTNH/
	oS
X-Google-Smtp-Source: AGHT+IEUQJWqqcjNrnEJCh5XmySlOY4g2F2iO77onI5FlsaxvRv2O6pfIuRwF5B32E+ufZXFTLk3Hw==
X-Received: by 2002:a05:6402:540e:b0:615:5bec:1df with SMTP id 4fb4d7f45d1cf-61d26d5e7b2mr9549028a12.25.1756819768238;
        Tue, 02 Sep 2025 06:29:28 -0700 (PDT)
Received: from XPS ([2a02:908:1b0:afe0:a26d:192:8cf5:7a0d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5315c7sm9404959a12.46.2025.09.02.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:29:27 -0700 (PDT)
Date: Tue, 2 Sep 2025 15:29:25 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: math-emu: replace deprecated strcpy() in me-debugfs
Message-ID: <aLbxNfo9Y0QkF1fC@XPS>
References: <20250901133920.94022-1-osama.abdelkader@gmail.com>
 <aLbbQ1vwnXYwU6JJ@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLbbQ1vwnXYwU6JJ@alpha.franken.de>

On Tue, Sep 02, 2025 at 01:55:47PM +0200, Thomas Bogendoerfer wrote:
> On Mon, Sep 01, 2025 at 03:39:19PM +0200, Osama Abdelkader wrote:
> > use strscpy() instead of deprecated strcpy().
> > 
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> >  arch/mips/math-emu/me-debugfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/mips/math-emu/me-debugfs.c b/arch/mips/math-emu/me-debugfs.c
> > index d5ad76b2bb67..94667cbe18e7 100644
> > --- a/arch/mips/math-emu/me-debugfs.c
> > +++ b/arch/mips/math-emu/me-debugfs.c
> > @@ -41,7 +41,7 @@ static void adjust_instruction_counter_name(char *out_name, char *in_name)
> >  {
> >  	int i = 0;
> >  
> > -	strcpy(out_name, in_name);
> > +	strscpy(out_name, in_name, sizeof(out_name));
> 
> this is wrong. sizeof(out_name) is the size of the pointer, but not the
> size of the storage behind it. To be able to use strscpy() here you
> need to pass in the size of the given buffer and use that.
> 
> Thomas.
> 

Thanks Thomas, I just sent v2.

Regards,
Osama

> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

