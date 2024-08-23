Return-Path: <linux-mips+bounces-5039-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71095C8C1
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 11:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A392D1F22FAA
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C83149002;
	Fri, 23 Aug 2024 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjVJUxWe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED693BBC2;
	Fri, 23 Aug 2024 09:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403799; cv=none; b=l6scpfLktKoFGmfHvQs3SeLU89Iru0pQDfZ62Ey6m4lWJmSLVgPkTA8pa40Qj5+1pNk6KrBVr0UH77/fsH8SX9oZ+H0jJm2ImtoHoeyu1WXbXWcZEFejp21B/qNCaX3+O1j5CB/4vhBhE5R4IlHJP6DvkhrneCSY1HbmCvKpR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403799; c=relaxed/simple;
	bh=JHDgA+4K5kD+rffO0jaMEN4JBC+WFniX5fi10n/AL/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfxKyCvQCdVxxX1IjtBzaZpgnRK3Nb4QAycnuEJGWVHolHRXYA3BbiAmyPAq+QJHxiCml7hLJ+KzA+erLnMV1FfrcMxs8shhyxKMQFoyZE5s04vltF/UVA1nBvvvMFrDCZu5ePITYBq5DuQ8LGlOnTdXRAG7RTbEA6MqTV+hvDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjVJUxWe; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-534366c194fso1019614e87.0;
        Fri, 23 Aug 2024 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724403796; x=1725008596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9c1tkF/XpnwvcmWn+8tq3/kdf2/yWHcwXLK2di0RT8=;
        b=XjVJUxWe5+IfsvirXEJ8JOadCK+bKmgjit/Jk/5WBgaIxROf0dwSHz9jZzhl9IjHdB
         aUoxeCCmKZ9E9M4PdCbGJSTxV+IbNbuyetxZa5awOx0B/YhdIbrjq8ikWH1Cv/UTrrW6
         3bfWXGb91ZUtL3GkaH012YllPPQLWcwdgcIz7nGFckC7hEuWibtyLrNnBOBbfTErTNTO
         F5hneP+luiX27SVOQSh1cukXrC3D0g+wofJVuR45xvgpGln4Ae18Ck+QVumxR+tIc7s9
         fGlX2vGKRz4zwAp0xrUSGDEgWqNHm7eeEhRlEutJFzXNN5YA4XJQyLzoD6huKXgvJh78
         7oIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724403796; x=1725008596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9c1tkF/XpnwvcmWn+8tq3/kdf2/yWHcwXLK2di0RT8=;
        b=auqHoUCWKMGbWwZZ4t5K7J7t99T7V9klWpNLDzzrw4mIl9jpt9jtzhHrq74SBtZBUQ
         65FNEyZ0aBAsFW5UZrUjSxpey54LdtbLG+f+fMR1Ca93c0p3yBaBaA00uHFLZN65tMBW
         dQY7SPDpiZtTGqFDw1uN+01esn+vNp+crhNDS2ytwEAb0d+hG5gKlttNAjDw4YU5960+
         Q2jZrDHHIAiiCIRGSrY2LDQREIZudR/DJN0OiDQ5TOlJmMPQtogyoJ6iqXZcgiQsoli6
         Tlw4143PLZgzNFMauFsf5b5UOYdVW3euqijiOMdKEf3Fdh3EJCAQ2ppRP8dmNX+16h9u
         r0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoLwlwdn89Gzghu/Ax3g2YG7Eh0HFtM3Pjd5CLd1ROaxqEQ1kotPiD86jp50+tpUa3BTZ4W+Iz3uhu@vger.kernel.org
X-Gm-Message-State: AOJu0YysKin0/xGSY7L5kAytTuKO713500oHSIGpkEj+YQCKeORj+ogP
	TuDMT7MVk6xBLkHJj+Eqv3R9izYfShNRh2Yh7AvZyk53mSV4IzJG
X-Google-Smtp-Source: AGHT+IEzMgnzvuDtvKwH1FcXDvIMzBd41fH+RB89hLqrrq/bYljJuXimLmkHYsYZvYuKj2Ul0JATMA==
X-Received: by 2002:a05:6512:2812:b0:52c:d645:eda7 with SMTP id 2adb3069b0e04-53438778b5fmr918689e87.18.1724403794937;
        Fri, 23 Aug 2024 02:03:14 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea361d4sm490050e87.67.2024.08.23.02.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 02:03:14 -0700 (PDT)
Date: Fri, 23 Aug 2024 12:03:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Wu Bo <bo.wu@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Wu Bo <wubo.oduw@gmail.com>
Subject: Re: [PATCH] bus: bt1-axi: change to use devm_clk_get_enabled()
 helpers
Message-ID: <h6azhlugyd5vx7pwrdjg2my7h2gj4uadkv4e535y32or7r3jwi@7vo7wum5lo5r>
References: <20240823023103.1984437-1-bo.wu@vivo.com>
 <jwspy5qbmtkl32wngiv7cgypy7sox3zeqks3wkqsuqra6vx7p2@3xg2rbc3lxp5>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jwspy5qbmtkl32wngiv7cgypy7sox3zeqks3wkqsuqra6vx7p2@3xg2rbc3lxp5>

On Fri, Aug 23, 2024 at 11:56:55AM +0300, Serge Semin wrote:
> Hi Wu
> 
> On Thu, Aug 22, 2024 at 08:31:03PM -0600, Wu Bo wrote:
> > Make the code cleaner and avoid call clk_disable_unprepare()
> > 
> > Signed-off-by: Wu Bo <bo.wu@vivo.com>
> 
> Awesome! Thanks.
> 
> Acked-by: Serge Semin <fancer.lancer@gmail.com>
> 
> Could you also apply the same change to drivers/bus/bt1-apb.c ?

Grrr, too fast. Please see my further note.

> 
> -Serge(y)
> 
> > ---
> >  drivers/bus/bt1-axi.c | 19 +------------------
> >  1 file changed, 1 insertion(+), 18 deletions(-)
> > 
> > diff --git a/drivers/bus/bt1-axi.c b/drivers/bus/bt1-axi.c
> > index 4007e7322cf2..b0baae49aca6 100644
> > --- a/drivers/bus/bt1-axi.c
> > +++ b/drivers/bus/bt1-axi.c
> > @@ -146,32 +146,15 @@ static int bt1_axi_request_rst(struct bt1_axi *axi)
> >  	return ret;
> >  }
> >  
> > -static void bt1_axi_disable_clk(void *data)
> > -{
> > -	struct bt1_axi *axi = data;
> > -
> > -	clk_disable_unprepare(axi->aclk);
> > -}
> > -
> >  static int bt1_axi_request_clk(struct bt1_axi *axi)
> >  {

> >  	int ret;
> >  
> > -	axi->aclk = devm_clk_get(axi->dev, "aclk");
> > +	axi->aclk = devm_clk_get_enabled(axi->dev, "aclk");
> >  	if (IS_ERR(axi->aclk))
> >  		return dev_err_probe(axi->dev, PTR_ERR(axi->aclk),
> >  				     "Couldn't get AXI Interconnect clock\n");
> >  
> > -	ret = clk_prepare_enable(axi->aclk);
> > -	if (ret) {
> > -		dev_err(axi->dev, "Couldn't enable the AXI clock\n");
> > -		return ret;
> > -	}
> > -
> > -	ret = devm_add_action_or_reset(axi->dev, bt1_axi_disable_clk, axi);
> > -	if (ret)
> > -		dev_err(axi->dev, "Can't add AXI clock disable action\n");
> > -
> >  	return ret;

This will lead to the undefined value returned. Please drop the "ret"
variable and just return 0 in the last statement. After that feel free
to add my Ab-tag.

-Serge(y)

> >  }
> >  
> > -- 
> > 2.25.1
> > 

