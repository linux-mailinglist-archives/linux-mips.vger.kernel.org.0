Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8B4370BAB
	for <lists+linux-mips@lfdr.de>; Sun,  2 May 2021 15:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbhEBNrR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 2 May 2021 09:47:17 -0400
Received: from aposti.net ([89.234.176.197]:47286 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231941AbhEBNrR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 2 May 2021 09:47:17 -0400
Date:   Sun, 02 May 2021 14:45:43 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] ASoC: jz4740-i2s: fix function name
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org
Message-Id: <7KFHSQ.0D5Z90AZRGJV@crapouillou.net>
In-Reply-To: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
References: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le dim., mai 2 2021 at 15:08:55 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> This driver is not related to I2C protocol.
> 
> s/_i2c_/_i2s_/
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/jz4740/jz4740-i2s.c 
> b/sound/soc/jz4740/jz4740-i2s.c
> index 47d955c0bb6a1..fe5b3a2b239c6 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -372,7 +372,7 @@ static int jz4740_i2s_resume(struct 
> snd_soc_component *component)
>  	return 0;
>  }
> 
> -static void jz4740_i2c_init_pcm_config(struct jz4740_i2s *i2s)
> +static void jz4740_i2s_init_pcm_config(struct jz4740_i2s *i2s)
>  {
>  	struct snd_dmaengine_dai_dma_data *dma_data;
> 
> @@ -397,7 +397,7 @@ static int jz4740_i2s_dai_probe(struct 
> snd_soc_dai *dai)
>  	if (ret)
>  		return ret;
> 
> -	jz4740_i2c_init_pcm_config(i2s);
> +	jz4740_i2s_init_pcm_config(i2s);
>  	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
>  		&i2s->capture_dma_data);
> 
> --
> 2.26.2
> 


